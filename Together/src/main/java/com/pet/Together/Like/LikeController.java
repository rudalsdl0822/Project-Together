package com.pet.Together.Like;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.Together.AddPet.AddPetService;
import com.pet.Together.AddPet.Pet;

@Controller
public class LikeController {

	@Autowired
	private LikeService lService;

	@Autowired
	private AddPetService pService;

	@Autowired
	private HttpSession session;

	// 관심 목록 페이지 보여주기
	@SuppressWarnings("unchecked")
	@RequestMapping("/like/likeList")
	public String likeList(Model model) {
		String id = (String) session.getAttribute("id");
		if (id != null) {
			ArrayList<Like> list = (ArrayList<Like>) lService.selectById(id);
			ArrayList<Pet> plist = new ArrayList<Pet>();
			for (int i = 0; i < list.size(); i++) {
				Like l = list.get(i);
				Pet p = pService.getPet(l.getPet_id());
				plist.add(p);
			}
			model.addAttribute("list", list);
			model.addAttribute("plist", plist);
		}
		return "like/like";
	}

	// 있는지 확인 가능기능
	@RequestMapping("/like/check")
	@ResponseBody
	public boolean check(@RequestParam int pet_id) {
		String id = (String) session.getAttribute("id");

		Like l = lService.selectByIdPetId(pet_id, id);
		if (l == null) {
			return false;
		} else {
			return true;
		}
	}

	// 관심 추가
	@RequestMapping("/like/add")
	public ModelAndView addlike(@RequestParam int pet_id, HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		
		ModelAndView mav = new ModelAndView("like/likeJSON");
		String id = (String) session.getAttribute("id");
		System.out.println("addlike : " + id + " " + pet_id);

		Like l = new Like();

		l.setLike_num(lService.getNum());
		l.setId(id);
		l.setPet_id(pet_id);

		System.out.println("addlike l : " + l);
		lService.insertLike(l);

		return mav;
	}

	// 관심 삭제
	@RequestMapping("/like/delete")
	public ModelAndView dellike(@RequestParam(required = false, defaultValue = "-1") int like_num,
			@RequestParam(required = false, defaultValue = "-1") int pet_id) {
		ModelAndView mav = new ModelAndView("like/likeJSON");
		String id = (String) session.getAttribute("id");
		if (like_num != -1) {
			lService.deleteLike(like_num);
		} else if (pet_id != -1) {
			lService.deleteLikeByPetId(pet_id, id);
		}
		return mav;
	}

	// 관심 리스트 전체 삭제
	@RequestMapping("/like/likeDelAll")
	public String delAll() {
		String id = (String) session.getAttribute("id");
		lService.deleteAllLike(id);
		return "redirect:/like/likeList";
	}


	@RequestMapping("/like/countPet")
	@ResponseBody
	public String likePetCount(@RequestParam int pet_id) {
		return Integer.toString(lService.selectByPetId(pet_id).size());
	}

}