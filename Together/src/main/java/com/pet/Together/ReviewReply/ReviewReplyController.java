package com.pet.Together.ReviewReply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewReplyController {

	@Autowired
	private ReviewReplyService reviewReplyService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	@PostMapping("/reviewReply/add")
	public ModelAndView addReply(ReviewReply r) {
		ModelAndView mav = new ModelAndView("/Review/Json");
		System.out.println(r);
		if (r.getReply_content() != null) {
			reviewReplyService.addReply(r);
			System.out.println("댓글이 입력되었습니다." + r);
		}
		return mav;
	}

	@PostMapping("/reviewReply/edit")
	public String editReply(ReviewReply r) {
		String writer_id = (String) session.getAttribute("id");
		r.setWriter_id(writer_id);
		reviewReplyService.editReply(r);
		return "redirect:" + request.getHeader("REFERER") + "#reply-" + r.getReply_num();
	}

//	댓글 삭제
	@RequestMapping("/reviewReply/delete")
	public String deleteReply(@RequestParam int reply_num) {
		String writer_id = (String) session.getAttribute("id");
		ReviewReply r = reviewReplyService.getReply(reply_num);
		if (writer_id.equals(r.getWriter_id())) {
//			대댓글이 있을 때 내용을 null로 변경
			if (r.getChild_reply().size() != 0 && r.getParent_reply_num() == -1) {
				reviewReplyService.deleteParentReply(reply_num);
			} else {
//				없을 때 삭제
				reviewReplyService.deleteReply(reply_num);
			}
		}
		return "redirect:" + request.getHeader("REFERER");
	}

	@PostMapping("/reviewReply/getReplyList")
	public ModelAndView getReplyList(@RequestParam(value = "board_num") int board_num) {
		ModelAndView mav = new ModelAndView("/Review/Reply");
		// 부모 댓글만 가져옴
		ArrayList<ReviewReply> list = reviewReplyService.getReplyListByBoard_num(board_num);
		for (int i = 0; i < list.size(); i++) {
			ReviewReply r = list.get(i);
			// 부모 댓글인 경우만 자식 댓글을 확인 후 저장
			int parent_reply_num = r.getReply_num();
			ArrayList<ReviewReply> child_reply = reviewReplyService.getListByParent_reply_num(parent_reply_num);
			r.setChild_reply(child_reply);
		}
		mav.addObject("list", list);
		return mav;
	}

}