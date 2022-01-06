package com.pet.Together.AddPet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.Together.Adopt.Adopt;
import com.pet.Together.Adopt.AdoptService;
import com.pet.Together.Adopt.PagingVO;
import com.pet.Together.Member.Member;
import com.pet.Together.Member.MemberService;


@Controller
public class AddPetController {

	@Autowired
	private AddPetService service;
	@Autowired
	private AdoptService adopt_service;
	@Autowired
	private MemberService member_service;

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

	

	/* ================================cha 추가중================================ */
	
	@RequestMapping(value = "/AddPet/AddPetList")
	public void addPetList() {

	}
	
	@RequestMapping(value = "/AddPet/EditPet")
	public void editPetForm() {

	}
	
	/* ================================cha 추가중================================ */
	

}
