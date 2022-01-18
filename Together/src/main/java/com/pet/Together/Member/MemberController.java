package com.pet.Together.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@GetMapping(value = "/Member/loginForm")
	public void loginForm() {

	}

	@GetMapping(value = "/Member/agreeForm")
	public void agreeForm() {

	}
	
	@GetMapping(value = "/index")
	public void index() {

	}
	
	@GetMapping(value = "/Member/login_fail")
	public void login_fail() {

	}
	
	@GetMapping(value = "/Member/joinResult")
	public void joinResult() {

	}

	@GetMapping(value = "/Member/joinForm")
	public void joinForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("idCheck", false);
	}

	@RequestMapping(value = "/Member/idCheck")
	public ModelAndView idCheck(HttpServletRequest request, @RequestParam(value = "id") String id) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("Member/idCheck");
		String result = "";
		Member m = service.getMember(id);

		if (m == null) {
			result = "사용 가능한 아이디 입니다.";
			session.setAttribute("idCheck", true);
		} else {
			result = "이미 사용중인 아이디 입니다.";
			session.setAttribute("idCheck", false);
		}

		mav.addObject("result", result);
		return mav;
	}
	@RequestMapping(value = "/Member/nicknameCheck")
	public ModelAndView nicknameCheck(HttpServletRequest request, @RequestParam(value = "nickname") String nickname) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("Member/nicknameCheck");
		String result = "";
		Member m = service.getMemberByNickname(nickname);

		if (m == null) {
			result = "사용 가능한 닉네임 입니다.";
			session.setAttribute("nicknameCheck", true);
		} else {
			result = "이미 사용중인 닉네임 입니다.";
			session.setAttribute("nicknameCheck", false);
		}

		mav.addObject("result", result);
		return mav;
	}
	
	
	@RequestMapping(value = "/Member/EditnicknameCheck")
	public ModelAndView EditnicknameCheck(HttpServletRequest request, @RequestParam(value = "nickname") String nickname) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("Member/nicknameCheck");
		String result = "";
		String id = (String) session.getAttribute("id");
		Member m = service.getMemberByNickname(nickname);
		Member m2 = service.getMember(id);

		if (m == null) {
			result = "사용 가능한 닉네임 입니다.";
			session.setAttribute("nicknameCheck", true);
		} else if (m != null && m2.getNickname().equals(nickname)) {
			result = "현재 사용하고 계신 닉네임 입니다.";
		    session.setAttribute("nicknameCheck", true);
		}
		else if (m != null && !m2.getNickname().equals(nickname)) {
			result = "이미 사용중인 닉네임 입니다.";
			session.setAttribute("nicknameCheck", false);
		}

		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/Member/join")
	public String join(Member m) {
		service.addMember(m);
		return "/Member/joinResult";
	}

	
	@RequestMapping(value = "/Member/login")
	public ModelAndView login(HttpServletRequest request, @RequestParam(value = "id") String id,@RequestParam(value = "pwd") String pwd) {
		Member m = service.getMember(id);
		ModelAndView mav = new ModelAndView("/Member/login_fail");
		boolean result = false;
		if (m != null && m.getPwd().equals(pwd)) {
			result = true;
			HttpSession session = request.getSession();
			session.setAttribute("id", m.getId());
			session.setAttribute("nickname", m.getNickname());
			session.setAttribute("type", m.getType());
			
		}
		mav.addObject("result",result);
		return mav;
	}
	
	/* =======================로그인 팝업창========================*/
	@GetMapping(value = "/Member/loginFormPopup")
	public void loginFormPopup() {

	}
	
	@RequestMapping(value = "/Member/loginByPopup")
	public ModelAndView loginByPopup(HttpServletRequest request, @RequestParam(value = "id") String id,@RequestParam(value = "pwd") String pwd) {
		boolean loginResult;    // "/Member/login_fail";
		
		Member m = service.getMember(id);
		if (m == null || !m.getPwd().equals(pwd)) {
			loginResult=false;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", m.getId());
			session.setAttribute("nickname", m.getNickname());
			session.setAttribute("type", m.getType());
			loginResult=true;
		}
		
		ModelAndView mav=new ModelAndView("Member/loginPopupResult","loginResult",loginResult);
		return mav;
	}
	/* =======================로그인 팝업창========================*/
	
	
	
	@RequestMapping(value = "/Member/MyPage")
	public ModelAndView MyPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Member/MyPage");
		HttpSession session = req.getSession(false);
		/*
		 * if(session.getAttribute("id")==null) { return "/Member/loginForm"; }
		 */
		String id = (String) session.getAttribute("id");
		Member m = service.getMember(id);
		mav.addObject("m", m);
		return mav;
	}

	

	@RequestMapping(value = "/Member/logout")
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.removeAttribute("nickname");
		session.removeAttribute("type");
		session.invalidate();
		return "/index";
	}

 

	@RequestMapping(value = "/Member/out") 
	public String out(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		service.delMember(id);
		return "redirect:/Member/logout";
	}
	
	@RequestMapping(value = "/Member/editForm")
	public ModelAndView editForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Member/editForm");
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getMember(id);
		mav.addObject("m", m);
		return mav;
	}

	@PostMapping(value = "/Member/edit")
	public String edit(Member m) {
		service.editMember(m);
		return "redirect:/Member/MyPage";
	}
	
	
}
