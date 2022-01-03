package com.pet.Together.AddPet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddPetController {

	@Autowired
	private AddPetService service;

	@RequestMapping(value = "/index")
	public void index() {

	}

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
		
		/* 파일이 있으면 저장한다. */
		if(originalFileName!=null && !originalFileName.equals("") ) {
			
			/* path 디렉토리가 없다면 디렉토리를 만든다. */
			String dirPath=PATH+petId;
			File dir=new File(dirPath);
			if( !dir.exists() ) {
				dir.mkdirs(); // 상위폴더가 없다면 상위 폴더도 만든다.				
			}
			
			/* 경로에 파일을 만든다. */
			
				File f=new File(dirPath+"/"+fileNum);
				try {
					file.transferTo(f);
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
		}
	}
	
	/* ================================juDayoung 추가중================================ */


	@RequestMapping("/AddPet/WaitingPet")
	public ModelAndView waitingPet(int id) {
		/*
		 * 1. to_Pet DB에서 id가 일치하는 Pet을 찾는다.
		 * 2. ====이미지 불러오기는 추후 추가할 예정====================
		 * 3. Pet 클래스를 입양공고 상세보기 뷰로 보낸다.  
		 * 4. Pet id에 맞는 댓글들을 리스트로 가져온다.
		 */
		Pet p=service.getPet(id);
		ModelAndView mav=new ModelAndView("AddPet/WaitingPet","pet",p);
		
		/* ====댓글리스트 보경이파트========================= */
		ArrayList reply_list=new ArrayList();
		mav.addObject("list", reply_list);
		/* ====댓글리스트 보경이파트 끝========================= */
		
		System.out.println("-----입양공고 상세보기------------------------------");
		System.out.println("id가 " + p.getId() + "인 입양대기 동물을 찾습니다.");
		System.out.println(p);
		System.out.println("state=" + p.getState() + " (입양대기)");
		System.out.println("-----------------------------------------------\n");
		
		return mav;

	}

	@RequestMapping("/AddPet/AdoptForm")
	public void adoptForm(Pet p) {
		System.out.println("-----입양신청폼-----------------------------------");
		System.out.println("id가 " + p.getId() + "인 입양대기 동물의 입양신청 폼으로 갑니다.");
		System.out.println("state=2 (입양대기)");
		System.out.println("-----------------------------------------------\n");
	}

	@RequestMapping("/AddPet/AdoptWish")
	public String adoptWish() {
		System.out.println("-----입양신청완료----------------------------------");
		System.out.println("id가 22인 입양대기 동물을 입양신청합니다.");
		System.out.println("state=3 (입양문의중)");
		System.out.println("-----------------------------------------------\n");
		return "index";
	}

	@RequestMapping("/AddPet/AdoptWishList")
	public void adoptWishList() {
		System.out.println("-----입양신청리스트---------------------------------");
		System.out.println("입양신청자들의 리스트를 봅니다.");
		System.out.println("state=3 (입양문의중)");
		System.out.println("-----------------------------------------------\n");

	}

	@RequestMapping("/AddPet/WaitingPerson")
	public void waitingPerson() {
		System.out.println("-----입양신청 상세보기------------------------------");
		System.out.println("id가 22인 입양대기 동물과 입양신청한 id가 67인 사람의 입양신청으로 갑니다.");
		System.out.println("state=3 (입양문의중)");
		System.out.println("-----------------------------------------------\n");
	}

	@RequestMapping("/AddPet/AdoptAccept")
	public String adoptAccept() {
		System.out.println("-----입양신청승인----------------------------------");
		System.out.println("id=22인 펫에 대하여 id=67인 신청자의 입양신청을 승인합니다.");
		System.out.println("state=4 (입양완료)");
		System.out.println("-----------------------------------------------\n");

		return "index";
	}

	/* ================================juDayoung 추가중================================ */
	

	/* ================================cha 추가중================================ */
	
	@RequestMapping(value = "/AddPet/AddPetList")
	public void addPetList() {

	}
	
	@RequestMapping(value = "/AddPet/EditPet")
	public void editPetForm() {

	}
	
	@RequestMapping(value = "/AddPet/AdoptNoticeList")
	public void adoptNoticeList() {

	}
	
	/* ================================cha 추가중================================ */
	

}
