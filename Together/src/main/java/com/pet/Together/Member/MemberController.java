package com.pet.Together.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	@RequestMapping(value = "/Member/join")
	public String join(Member m) {
		service.addMember(m);
		return "/Member/loginForm";
	}

	
	@RequestMapping(value = "/Member/login")
	public String login(HttpServletRequest request, @RequestParam(value = "id") String id,@RequestParam(value = "pwd") String pwd) {
		Member m = service.getMember(id);
		if (m == null || !m.getPwd().equals(pwd)) {
			return "/Member/login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", m.getId());
			session.setAttribute("nickname", m.getNickname());
			session.setAttribute("type", m.getType());
			return "/index";
		}
	}
}
