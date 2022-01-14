package com.pet.Together.AddPet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.Together.Adopt.AdoptService;
import com.pet.Together.Member.MemberService;


@Controller
public class AddPetController {

	@Autowired
	private AddPetService service;
	@Autowired
	private AdoptService adopt_service;
	@Autowired
	private MemberService member_service;
	
	
	@Autowired
	private HttpServletRequest request;



	@RequestMapping(value = "/AddPet/AddPet")
	public void addPetForm() {

	}

	@RequestMapping(value="/AddPet/AddPetResult")
	public void addPetResult() {
		
	}

	@PostMapping(value = "/AddPet")
	public String addPet(Pet p, Img imgs) { // id 제외하고 값 넘어옴.
		int petId = service.makeId();
		
		MultipartFile[] imgList = {imgs.getFile1(),imgs.getFile2(),imgs.getFile3()};
		
		p.setId(petId);
		p.setImgs(imgs);
		
		for (int i = 0 ; i<imgList.length;i++) {
			saveImg(imgList[i],petId,i+1);
		}
		service.addPet(p);
		return "/AddPet/AddPetResult";
	}

	private static final String PATH = "C:\\together\\img\\pet\\";

	/*
	 * 이미지를 폼에서 받아, C:\\together\\img\\pet\\번호(petId) 폴더에 저장한다.
	 */
	public void saveImg(MultipartFile file, int petId, int fileNum) {
		
		// 파일 이름을 가져온다.
		String originalFileName=file.getOriginalFilename();
		
		// 확장자 추출
		int idx = originalFileName.lastIndexOf(".");
	    String ext = originalFileName.substring(idx);
		
		/* 파일이 있으면 저장한다. */
		if(originalFileName!=null && !originalFileName.equals("") ) {
			
			/* path 디렉토리가 없다면 디렉토리를 만든다. */
			String dirPath=PATH+petId;
			File dir=new File(dirPath);
			if( !dir.exists() ) {
				dir.mkdirs(); // 상위폴더가 없다면 상위 폴더도 만든다.				
			}
			
			/* 경로에 파일을 만든다. 예)1.확장자 */
				File f=new File(dirPath+"/"+fileNum+ext);

				try {
					file.transferTo(f);
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
		}
	}

	

	/* ================================cha 추가중================================ */
	
	@RequestMapping(value="/AddPet/PetAllList")
	public ModelAndView addPetList() {
		ModelAndView mav = new ModelAndView("AddPet/PetAllList");
		ArrayList<Pet> list = (ArrayList<Pet>)service.getPetAllList();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/AddPet/StateList")
	public ModelAndView stateList(@RequestParam(value="state") int state, @RequestParam(value="page") String page) {
		ModelAndView mav=new ModelAndView();
		if(page.equals("PetAllList")) {
			mav = new ModelAndView("AddPet/PetAllList");			
		} else if(page.equals("AdoptNotice")) {
			mav = new ModelAndView("AddPet/AdoptNoticeList");			
		}
		ArrayList<Pet> list = (ArrayList<Pet>)service.getStateList(state);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/AddPet/petView")
	public ModelAndView petView(@RequestParam(value="id") int id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AddPet/EditPet");
		Pet p = service.getPet(id);
		String path = PATH+p.getId()+"\\";
		File imgDir = new File(path);
		if(imgDir.exists()) {
			String[]files = imgDir.list();
			for(int j = 0; j < files.length; j++) {
				mav.addObject("file"+j, files[j]);
			}
		}
		mav.addObject("p", p);
		return mav;
	}
	
	
	
	@RequestMapping("/AddPet/petImg")
	public ResponseEntity<byte[]> getPetImg(int id, int petImgNum) {
		File imgFile = new File(PATH+id);
		String[] imgFiles=imgFile.list();
		int ifs;
		if(imgFiles!=null) {
			for(ifs=0; ifs<imgFiles.length; ifs++) {
				// System.out.println(imgFiles+" / imgFiles[ifs] : "+imgFiles[ifs]);
			}
		}
		
		File f = null;
		
		if(petImgNum==1) {
			f = new File(PATH+id+"\\"+imgFiles[0]);
		}else if(petImgNum==2) {
			f = new File(PATH+id+"\\"+imgFiles[1]);
		}else if(petImgNum==3) {
			f = new File(PATH+id+"\\"+imgFiles[2]);
		}
		
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/Addpet/EditPet")
	public String EditPet(Pet p) {
		service.editPet(p);
		return "redirect:/AddPet/PetAllList";
	}
	
	
	
	
	
	@RequestMapping(value="/AddPet/LocationAllList")
	public ModelAndView locationAllList(@RequestParam(value="location") int location) {
		ModelAndView mav = new ModelAndView("AddPet/PetAllList");
		ArrayList<Pet> list = (ArrayList<Pet>)service.getLocation(location);
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	@RequestMapping(value="/Addpet/DeletePet")
	public String delPet(@RequestParam(value="id") int id) {
		service.deletePet(id);
		String path = PATH+id+"\\";
		File imgDir = new File(path);
		if(imgDir.exists()) {
			String[] files=imgDir.list();
			for(int j = 0; j <files.length; j++) {
				File f = new File(path+files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		return "redirect:/AddPet/PetAllList";
	}
	

	
	
	
	@RequestMapping(value="/AddPet/LocationState23List")
	public ModelAndView locationList(@RequestParam(value="location") int location) {
		ModelAndView mav = new ModelAndView("AddPet/AdoptNoticeList");
		ArrayList<Pet> list = (ArrayList<Pet>)service.getLocationState23(location);
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value = "/AddPet/AdoptNoticeList")
	public ModelAndView adoptNoticeList() {
		ModelAndView mav = new ModelAndView("AddPet/AdoptNoticeList");
		ArrayList<Pet> list=(ArrayList<Pet>)service.getState23();
		mav.addObject("list",list);
		return mav;
	}

	
	

	
	
	
	@GetMapping("/AddPet/SearchPet")
	public String searchPet(@RequestParam(value="page") String page, @RequestParam(required=false) String search, @RequestParam(required=false) String value, Model model) {
		if(search != null && value != null) {
			request.setAttribute("search", search);
			request.setAttribute("value", value);
			ArrayList<Pet> list = null;
			
			if(search.equals("breed")) {
				list = (ArrayList<Pet>)service.getBreed(value);
			} else if(search.equals("age")) {
				list = (ArrayList<Pet>)service.getAgeList(value);
			} else if(search.equals("name")) {
				list = (ArrayList<Pet>)service.getPetName(value);
			} else if(search.equals("writer_id")) {
				list = (ArrayList<Pet>)service.getWriter_id(value);
			}
			model.addAttribute("list", list);
			
			if(page.equals("PetAllList")) {
				return "/AddPet/PetAllList";	
			} else if(page.equals("AdoptNotice")) {
				return "/AddPet/AdoptNoticeList";			
			}
		} else {
			if(page.equals("PetAllList")) {
				return "redirect:/AddPet/PetAllList";	
			} else if(page.equals("AdoptNotice")) {
				return "redirect:/AddPet/AdoptNoticeList";		
			}
		}
		return "redirect:/";
	}
	

}
