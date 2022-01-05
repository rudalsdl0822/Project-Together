package com.pet.Together.AddPet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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

@Controller
public class AddPetController {

	@Autowired
	private AddPetService service;
	@Autowired
	private AdoptService adopt_service;

	@RequestMapping(value = "/index")
	public void index() {

	}

	@RequestMapping(value = "/AddPet/AddPet")
	public void addPetForm() {

	}

	@PostMapping(value = "/AddPet")
	public String addPet(Pet p) {
    
		service.addPet(p);
		return "";
	}

	private static final String PATH = "C:\\together\\img";

	/*
	 * 이미지를 폼에서 받아, C:\\together\\img\\pet\\petId번호 폴더에 'file번호'파일로 저장한다.
	 */
	public void saveImg(MultipartFile file, int petId, int fileNum) {
		/* message를 print 한다. */
		String message="이미지파일을 C:\\together\\img\\pet\\petId"+petId+"폴더에 'file"+fileNum+"'로 저장합니다.";
				
		String originalFileName=file.getOriginalFilename();
		
		/* 파일이 있으면 저장한다. */
		if(originalFileName!=null && !originalFileName.equals("") ) {
			/* 파일 형식을 fileFormat으로 저장한다. */
			String fileFormat=originalFileName.split("\\.")[1];
		
			/* path 디렉토리가 없다면 디렉토리를 만든다. */
			String dirName=PATH+"\\pet\\petId"+petId;
			File dir=new File(dirName);
			if( !dir.exists() ) {
				dir.mkdir();				
			}
			
			/* 이미 파일명이 존재한다면 파일을 저장하지 않는다.*/
			boolean fileExist=false;
			
			String fileName="file"+fileNum;
			String[] files=dir.list();
			for(String f:files) {
				String fname=f.split("\\.")[0];
				if(fname.equals(fileName) ) {
					fileExist=true;
					message="저장 실패.	C:\\together\\img\\pet\\petId"+petId+"폴더에 file"+fileNum+"이 이미 존재하여 저장하지 않았습니다.";
				}
			}			
			
			/* 경로에 파일을 만든다. */
			if( !fileExist ) {
				File f=new File(dirName+"\\"+fileName+"."+fileFormat);
				try {
					file.transferTo(f);
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			System.out.println(message);			
		}


	}
	
	
	
	
	
	
	
	/* ================================juDayoung 추가중================================ */


	@RequestMapping("/AddPet/WaitingPet")
	public ModelAndView waitingPet(int id) {  // 입양공고 상세보기
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
		System.out.println("id가 " + p.getId() + "인 동물을 찾습니다.");
		System.out.println(p);
		System.out.println("state=" + p.getState() );
		System.out.println("-----------------------------------------------\n");
		
		return mav;

	}

	@RequestMapping("/AddPet/AdoptForm")
	public ModelAndView adoptForm(int id) {  // 입양신청 폼
		/*
		 * 1. ====추후 추가할 예정 : session에서 로그인한 회원의 id를 가져온다.====================
		 * 2. ====추후 추가할 예정 : 회원이 작성한 입양신청정보(MemberInfo)가 있다면 가져온다. 없을시 AdoptForm에서 새로 작성.====================
		 * 3. 입양신청 할 Pet의 id로 Pet정보를 가져온다.
		 */
		
		Pet p=service.getPet(id);
		ModelAndView mav=new ModelAndView("AddPet/AdoptForm","pet",p);
		
		System.out.println("-----입양신청폼-----------------------------------");
		System.out.println("id가 " + p.getId() + "인 입양대기 동물의 입양신청 폼으로 갑니다.");
		System.out.println(p);
		System.out.println("state=" + p.getState() );
		System.out.println("-----------------------------------------------\n");
		
		return mav;
	}

	@RequestMapping("/AddPet/AdoptWish")
	public String adoptWish(Adopt adopt) {  // 입양신청 완료
		/*
		 * 1. 입양신청 DB에 writer를 회원 id(session)로 써서 작성한다.
		 * 2. pet의 state를 3(입양문의중)으로 바꿔준다.
		 * 3. index.jsp로 돌아간다.
		 */
		adopt.setWriter("j");  //임시 유저.
		adopt_service.addAdopt(adopt);
		
		Pet p=service.getPet(adopt.getPet_id());
		p.setState(3);
		service.editPet(p);
		
		System.out.println("-----입양신청완료----------------------------------");
		System.out.println("id가 "+p.getId() +"인 입양대기 동물을 입양신청합니다.");
		System.out.println(adopt);
		System.out.println("state="+p.getState() +" (입양문의중)");
		System.out.println("-----------------------------------------------\n");
		
		return "index";
	}

	
	@RequestMapping("/AddPet/AdoptWishList")  // 입양신청 리스트
	public ModelAndView adoptWishList(PagingVO vo
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage
			, @RequestParam(value="state", required=false) String state) {  
		/*
		 * 1. to_adopt DB에서 adoptList를 불러온다.
		 * 2. 페이징을 추가한다.
		 * 3. state=0(입양신청중) 이 기본으로 하고, 1이면 승인만 모아서, 2면 거절만 모아서, 3이면 전체 입양신청글을 보여준다.
		 * 4. 뷰에 adoptList를 넣어준다.
		 */		
		
		state=(state==null)? "0":state;
		
		/* ===============입양신청 리스트 페이징 시작=============== */
		int total=adopt_service.countAdopt0();
		switch(state) {
		case "1":
			total=adopt_service.countAdopt1();
			break;
		case "2":
			total=adopt_service.countAdopt2();
			break;
		case "3":
			total=adopt_service.countAdopts();
			break;
		}

		nowPage=(nowPage==null)? "1":nowPage;
		cntPerPage=(cntPerPage==null)? "3":cntPerPage;
		vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		/* ===============입양신청 리스트 페이징 끝=============== */
		
		/* ===============입양신청 리스트 state 구분 시작=============================== */
		
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) adopt_service.selectAdopt0(vo);
		switch(state) {
		case "1":
			adoptList=(ArrayList<Adopt>) adopt_service.selectAdopt1(vo);
			break;
		case "2":
			adoptList=(ArrayList<Adopt>) adopt_service.selectAdopt2(vo);
			break;
		case "3":
			adoptList=(ArrayList<Adopt>) adopt_service.selectAdopts(vo);
			break;
		}
		/* ===============입양신청 리스트 state 구분 끝================================= */
		
		ModelAndView mav=new ModelAndView("AddPet/AdoptWishList","adoptList",adoptList);
		mav.addObject("paging", vo);
		mav.addObject("state", state);
		
		System.out.println("-----입양신청리스트---------------------------------");
		System.out.println("입양신청 게시글의 리스트를 봅니다.");
		System.out.println("----페이징을 시작합니다. 페이지당 글 갯수="+cntPerPage);
		System.out.println("----첫 페이지 게시글 : "+adoptList);
		System.out.println("-----------------------------------------------\n");

		return mav;
	}
	

	@RequestMapping("/AddPet/WaitingPerson")
	public ModelAndView waitingPerson(int num) {  // 입양신청 상세보기
		/*
		 * 1. to_adopt db 에서 num이 맞는 adopt를 찾는다.
		 * 2. member를 찾는다.
		 * 3. pet을 찾는다.
		 * 4. 뷰에 adopt, member, pet를 넣어준다.
		 */
		
		Adopt adopt=adopt_service.getAdopt(num);
		Pet pet=service.getPet(adopt.getPet_id());
		//Member member;
		ModelAndView mav=new ModelAndView("AddPet/WaitingPerson","Adopt",adopt);
		mav.addObject("pet", pet);
		//mav.addObject("member", member);
		
		System.out.println("-----입양신청 상세보기------------------------------");
		System.out.println("Adopt num : "+num);
		System.out.println("member id : "+adopt.getWriter());
		System.out.println("pet id : "+adopt.getPet_id());
		System.out.println("입양신청 #"+num+" 상세보기로 갑니다.");
		System.out.println("-----------------------------------------------\n");
		
		return mav;
	}

	@RequestMapping("/AddPet/AdoptAccept")
	public String adoptAccept(int num
			, PagingVO vo
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage
			, @RequestParam(value="state", required=false) String state) {
		/*
		 * 1. Adopt num를 받아 state=1로 바꿔준다.
		 * 2. pet state=4로 바꿔준다.
		 * 3. ===========추후 구현 예정 : member 에게 알린다 ==============
		 * 4. 보고 있던 입양신청 리스트로 돌아간다.("forward:/AddPet/AdoptWishList" : foward는 request를 유지시켜줌.)
		 */
		
		Adopt adopt=adopt_service.getAdopt(num);
		adopt.setState(1);
		adopt_service.editAdopt(adopt);
		
		Pet pet=service.getPet(adopt.getPet_id());
		pet.setState(4);
		//service.editPet(); 추가할 예정
		
		System.out.println("-----입양신청승인----------------------------------");
		System.out.println("Adopt num : "+num);
		System.out.println("member id : "+adopt.getWriter());
		System.out.println("pet id : "+adopt.getPet_id());
		System.out.println("신청자의 입양신청을 승인합니다. 입양완료.");
		System.out.println("-----------------------------------------------\n");

		return "forward:/AddPet/AdoptWishList";
	}
	
	


	/* ================================juDayoung 추가중================================ */
	
	
	

}
