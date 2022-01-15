package com.pet.Together.Adopt;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.Together.AddPet.AddPetService;
import com.pet.Together.AddPet.Pet;
import com.pet.Together.Like.Like;
import com.pet.Together.Like.LikeController;
import com.pet.Together.Like.LikeService;
import com.pet.Together.Member.MemberService;
import com.pet.Together.Reply.Reply;
import com.pet.Together.Reply.ReplyService;

@Controller
public class AdoptController {
	
	@Autowired
	private AddPetService service;
	@Autowired
	private AdoptService adopt_service;
	@Autowired
	private MemberService member_service;
	@Autowired
	private ReplyService reply_service;
	@Autowired
	private LikeService like_service;
	
	@Autowired
	private LikeController like_controller;
	
	@Autowired
	private HttpSession session;


	@RequestMapping("/Adopt/WaitingPet")
	public ModelAndView waitingPet(int id) {  // 입양공고 상세보기

		/*
		 * 1. to_Pet DB에서 id가 일치하는 Pet을 찾는다.
		 * 2. session의 member id로 현재 이 펫을 관심등록중인지 확인한다.
		 * 3. Pet 클래스를 입양공고 상세보기 뷰로 보낸다.  
		 * 4. Pet id에 맞는 댓글들을 리스트로 가져온다.
		 */
		Pet p=service.getPet(id);
		ModelAndView mav=new ModelAndView("Adopt/WaitingPet","pet",p);
		
			//로그인이 되어 있고, 관심등록을 했는지 확인한다.
		boolean ifLikePet=false;
		if( (String) session.getAttribute("id")!=null ) {
			ifLikePet=like_controller.check(id);
		}
		mav.addObject("ifLikePet", ifLikePet);
		
		/* ====댓글리스트 보경이파트========================= */
		ArrayList<Reply> reply_list=reply_service.getReplyListByBoard_num(id);
		mav.addObject("replys", reply_list);

		ArrayList<Reply> childReply_list = reply_service.getListByParent_reply_num(id);
		mav.addObject("c_replys", childReply_list);
		/* ====댓글리스트 보경이파트 끝========================= */
		
		System.out.println("-----입양공고 상세보기------------------------------");

		System.out.println("pet id가 " + p.getId() + "인 동물을 찾습니다.");
		System.out.println(p);
		System.out.println("pet state=" + p.getState() );
		System.out.println("관심등록 여부 : "+ifLikePet);
		//System.out.println("---- 댓글 리스트 : "+reply_list);

		System.out.println("-----------------------------------------------\n");
		
		return mav;

	}

	@RequestMapping("/Adopt/AdoptForm")
	public ModelAndView adoptForm(int id) {  // 입양신청 폼
		/*
		 * 1. session에서 로그인한 회원의 id를 가져온다.
		 * 2. ====추후 추가할 예정 : 회원이 작성한 입양신청정보(MemberInfo)가 있다면 가져온다. 없을시 AdoptForm에서 새로 작성.====================
		 * 3. 입양신청 할 Pet의 id로 Pet정보를 가져온다.
		 */
		
		String member_id=(String) session.getAttribute("id");
		
		Pet p=service.getPet(id);
		ModelAndView mav=new ModelAndView("Adopt/AdoptForm","pet",p);
		
		System.out.println("-----입양신청폼-----------------------------------");
		System.out.println("pet id가 " + p.getId() + "인 입양대기 동물의 입양신청 폼으로 갑니다.");
		System.out.println(p);
		System.out.println("pet state=" + p.getState() );
		System.out.println("-----------------------------------------------\n");
		
		return mav;
	}

	@RequestMapping("/Adopt/AdoptWish")
	public String adoptWish(Adopt adopt) {  // 입양신청 완료
		/*
		 * 1. 입양신청글 adopt를 입양신청 DB에 추가한다.
		 * 2. pet의 state를 3(입양문의중)으로 바꿔준다.
		 * 3. index.jsp로 돌아간다.
		 */
		
		adopt_service.addAdopt(adopt);
		
		Pet p=service.getPet(adopt.getPet_id());
		p.setState(3);
		service.editPetState(p);
		
		System.out.println("-----입양신청완료----------------------------------");
		System.out.println("pet id가 "+p.getId() +"인 입양대기 동물을 입양신청합니다.");
		System.out.println(adopt);
		System.out.println("pet state="+p.getState() +" (입양문의중)");
		System.out.println("-----------------------------------------------\n");
		
		return "index";
	}

	@RequestMapping("/Adopt/AdoptWishList")  // 입양신청 리스트
	public ModelAndView adoptWishList(PagingVO vo
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage
			, @RequestParam(value="state", required=false) String state
			, @RequestParam(value="searchPet_id", required=false) String searchPet_id) {  
		/*
		 * 1. member type이 관리자(2)인지 확인한다.
		 * 2-1) pet id 검색한 경우
		 * 2-2) pet id 검색하지 않은 경우
		 * 3. 페이징을 추가한다. 
		 * 4. state=0(입양신청중) 이 기본으로 하고, 1이면 승인만 모아서, 2면 거절만 모아서, 3이면 전체 입양신청글, 100은 마감글을 보여준다.
		 * 5. 뷰에 adoptList를 넣어준다.
		 */	
		
		/* 수정예정 - 페이징 오류 1건 : 3개씩 보기에서 24개씩 보기로 가면 마지막페이지에서 화면 사라지는 것*/
		
		// 로그인이 안되어 있거나 로그인 타입이 관리자가 아니면 로그인폼으로 간다.
		boolean flag=checkMemberType(2);
		if(flag==false) return new ModelAndView("Member/loginForm");
		
		/* =============setting================ */
		// 입양신청글의 state를 확인합니다. (0: 입양신청중  1: 승인  2: 거절  3: 전체  100: 마감)
		state=(state==null)? "0":state;
		int int_state=Integer.parseInt(state);
		
		// 페이징 변수를 초기화&확인합니다.
		int total=0;
		nowPage=(nowPage==null)? "1":nowPage;
		cntPerPage=(cntPerPage==null)? "3":cntPerPage;
		ArrayList<Adopt> adoptList=null;
		/* =============setting 끝================ */
		
		// pet id 검색한 경우
		if(searchPet_id!=null && !searchPet_id.equals("") ) {
			System.out.println("검색한 Pet id="+searchPet_id);
			
			Adopt searchAdopt=new Adopt();			
			int pet_id=Integer.parseInt(searchPet_id);
			searchAdopt.setPet_id(pet_id);
			searchAdopt.setState(int_state);
			total=adopt_service.countAdoptsByPet_idState(searchAdopt);
			if(int_state==3) total=adopt_service.countAdoptsByPet_id(pet_id);
			
			vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			adoptList=(ArrayList<Adopt>) adopt_service.selectAdoptByPet_idState(searchAdopt, vo);
			if(int_state==3) adoptList=(ArrayList<Adopt>) adopt_service.selectAdoptByPet_id(pet_id, vo);
		}else { 
			// pet id 검색하지 않은 경우
			total=adopt_service.countAdoptsByState(int_state);
			if(int_state==3) total=adopt_service.countAdopts();
			
			vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			adoptList=(ArrayList<Adopt>) adopt_service.selectAdoptByState(int_state, vo.getStart(), vo.getEnd());
			if(int_state==3) adoptList=(ArrayList<Adopt>) adopt_service.selectAdopts(vo);
		}
		
		ModelAndView mav=new ModelAndView("Adopt/AdoptWishList","adoptList",adoptList);
		mav.addObject("searchPet_id",searchPet_id);
		mav.addObject("paging", vo);
		mav.addObject("state", state);
		mav.addObject("total",total);
		
		System.out.println("-----입양신청리스트---------------------------------");
		System.out.println("입양신청 게시글의 리스트를 봅니다.");
		System.out.println("----페이징을 시작합니다. 입양신청 글 상태="+state);
		System.out.println("----페이지당 글 갯수="+cntPerPage);
		System.out.println("-----------------------------------------------\n");

		return mav;

	}
	

	@RequestMapping("/Adopt/WaitingPerson")
	public ModelAndView waitingPerson(int num) {  // 입양신청 상세보기
		/*
		 * 1. 자신이 작성한 글이면 수정이 가능하고 관리자면 승인/거절 할수 있게 한다.
		 * 2. to_adopt db 에서 num이 맞는 adopt를 찾는다.
		 * 3. 뷰에 adopt를 넣어준다.
		 */
		
		String member_id=(String) session.getAttribute("id");
		
		Adopt adopt=adopt_service.getAdopt(num);
		String writer=adopt.getWriter();
		
		if( !member_id.equals(writer) && (int) session.getAttribute("type")!=2 ) {
			return new ModelAndView("Member/loginForm");
		}
		
		ModelAndView mav=new ModelAndView("Adopt/WaitingPerson","Adopt",adopt);
		
		System.out.println("-----입양신청 상세보기------------------------------");
		System.out.println("Adopt num : "+num);
		System.out.println("member id : "+adopt.getWriter());
		System.out.println("pet id : "+adopt.getPet_id());
		System.out.println("입양신청 #"+num+" 상세보기로 갑니다.");
		System.out.println("-----------------------------------------------\n");
		
		return mav;
	}

	@RequestMapping("/Adopt/AdoptAccept")  // 입양승인
	public String adoptAccept(int num
			, PagingVO vo
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage
			, @RequestParam(value="state", required=false) String state) {
		/*
		 * 1. Adopt num를 받아 state=1로 바꿔준다.
		 * 2. pet state=4로 바꿔준다.
		 * 3. 다른 신청자들의 Adopt state=100(입양마감)로 바꿔준다.
		 * 4. 보고 있던 입양신청 리스트로 돌아간다.("forward:/Adopt/AdoptWishList" : foward는 request를 유지시켜줌.)
		 */
		
		Adopt adopt=adopt_service.getAdopt(num);
		adopt.setState(1);
		adopt_service.editAdopt(adopt);
		
		Pet pet=service.getPet(adopt.getPet_id());
		pet.setState(4);
		service.editPetState(pet); 
		
		ArrayList<Adopt> otherAdoptList=adopt_service.getAdoptsByPet_id(adopt.getPet_id());
		for(Adopt otherAdopt: otherAdoptList) {
			otherAdopt.setState(100);
			adopt_service.editAdopt(otherAdopt);
		}
		
		System.out.println("-----입양신청승인----------------------------------");
		System.out.println("Adopt num : "+num);
		System.out.println("member id : "+adopt.getWriter());
		System.out.println("pet id : "+adopt.getPet_id());
		System.out.println("신청자의 입양신청을 승인합니다. 입양완료.");
		System.out.println("다른 신청자의 입양신청을 마감처리(state=100) 합니다.");
		System.out.println("-----------------------------------------------\n");

		return "forward:/Adopt/AdoptWishList";
	}
	
	@RequestMapping("/Adopt/AdoptReject")  // 입양 거절
	public String adoptReject(int num
			, PagingVO vo
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage
			, @RequestParam(value="state", required=false) String state) {
		/*
		 * 1. Adopt num를 받아 state=2로 바꿔준다.
		 * 2-1. 다른 사람이 문의 중이면 pet state = 3
		 * 2-2. 다른 사람들의 문의가 없다면 pet state = 2
		 * 3. ===========추후 구현 예정 : member 에게 알린다 ==============
		 * 4. 보고 있던 입양신청 리스트로 돌아간다.("forward:/Adopt/AdoptWishList" : foward는 request를 유지시켜줌.)
		 */
		
		Adopt adopt=adopt_service.getAdopt(num);
		adopt.setState(2);
		adopt_service.editAdopt(adopt);
		
		Pet pet=service.getPet(adopt.getPet_id());
		ArrayList<Adopt> adoptsByPet_idState=adopt_service.getAdoptsByPet_idState(adopt.getPet_id(), 0);

		int pet_state = (adoptsByPet_idState.isEmpty() )? 2 : 3;
		pet.setState(pet_state);
		service.editPetState(pet); 
		
		System.out.println("-----입양신청거절----------------------------------");
		System.out.println("Adopt num : "+num);
		System.out.println("member id : "+adopt.getWriter());
		System.out.println("pet id : "+adopt.getPet_id()+"    pet state = "+pet_state);
		System.out.println("신청자의 입양신청을 거절합니다.");
		System.out.println("-----------------------------------------------\n");

		return "forward:/Adopt/AdoptWishList";
	}

	@RequestMapping("/Adopt/MemberAdoptWishList")  // 고객용 입양신청 내역
	public ModelAndView memberAdoptWishList(@RequestParam(value="state", required=false) String state
			) {  
		/*
		 * 1. session에서 member id를 가져오고 member type이 고객(1)인지 확인한다.
		 * 2. to_adopt DB에서 adoptList를 불러온다.
		 * 3. state=0(입양신청중) 이 기본으로 하고, 1이면 승인만 모아서, 2면 거절만 모아서, 3이면 전체 입양신청글을 보여준다.
		 * 4. 뷰에 adoptList를 넣어준다.
		 */	
		
		// 로그인이 안되어 있거나 로그인 타입이 고객이 아니면 로그인폼으로 간다.
		boolean flag=checkMemberType(1);
		if(flag==false) return new ModelAndView("Member/loginForm");
		
		String writer=(String) session.getAttribute("id");

		
		// 입양신청글의 state를 확인합니다. (0: 입양신청중  1: 승인  2: 거절)
		state=(state==null)? "0":state;
		int int_state=Integer.parseInt(state);
		
		/* 입양신청 리스트 */	
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) adopt_service.getAdoptsByWriter(writer, int_state);
		if(int_state==3) {
			adoptList=(ArrayList<Adopt>) adopt_service.getAdoptsAllByWriter(writer);
		}
		
		ModelAndView mav=new ModelAndView("Adopt/MemberAdoptWishList","adoptList",adoptList);
		mav.addObject("state", state);
		
		System.out.println("-----내 입양신청리스트---------------------------------");
		System.out.println("내 입양신청 게시글의 리스트를 봅니다.");
		System.out.println("----login id : "+writer);
		System.out.println("-----------------------------------------------\n");

		return mav;

	}
	
	@RequestMapping("/Adopt/MemberAdoptDelete")
	public ModelAndView memberAdoptDelete(int num) {
		adopt_service.deleteAdopt(num);
	
		System.out.println("-----내 입양신청 삭제---------------------------------");
		System.out.println("내 입양신청 글 1개를 삭제합니다.");
		System.out.println("----Delete Adopt num : "+num);
		System.out.println("내 입양신청 리스트를 새로 불러옵니다.");
		System.out.println("-----------------------------------------------\n");
		
		ModelAndView mav=new ModelAndView("Adopt/JSON","","");
		
		return mav;
	}
	
	@RequestMapping("/Adopt/MemberAdoptEdit")
	public ModelAndView memberAdoptEdit(Adopt adopt) {
		adopt_service.editAdopt(adopt);
	
		System.out.println("-----내 입양신청 수정---------------------------------");
		System.out.println("내 입양신청 글을 수정합니다.");
		System.out.println("----Edit Adopt num="+adopt.getNum());
		System.out.println("-----------------------------------------------\n");
		
		ModelAndView mav=new ModelAndView("Adopt/JSON","","");
		
		return mav;
	}
	
	
	/* =============== 새로 정의한 함수 =============================================================== */
		// 로그인한 member의 type을 확인하는 메소드입니다. 
	public boolean checkMemberType(int type) {
		if(session.getAttribute("type")==null || (int) session.getAttribute("type")!=type) {
			if(type==1) {
				System.out.println("****고객 기능 사용불가 : 로그인 타입이 고객이 아닙니다. 재 로그인 해주세요.");
			}else if(type==2) {
				System.out.println("****관리자 기능 사용불가 : 로그인 타입이 관리자가 아닙니다. 재 로그인 해주세요.");
			}
			return false;
		}
		return true;
	}
	
}
