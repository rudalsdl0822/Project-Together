package com.pet.Together.Reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	// 댓글 추가
	@PostMapping("/reply/add")
	public ModelAndView addReply(Reply r) {
		ModelAndView mav = new ModelAndView("/Adopt/ReplyJson");
		System.out.println(r);
		replyService.addReply(r);
		System.out.println("댓글이 입력되었습니다." + r);
		mav.addObject("r", r);
		return mav;
	}

	@PostMapping("/reply/get")
	public ModelAndView getReply(@RequestParam int reply_num) {
		ModelAndView mav = new ModelAndView("/Adopt/ReplyJson");
		Reply r = replyService.getReply(reply_num);
		System.out.println(r);
		mav.addObject("r", r);
		return mav;
	}

	// 댓글 수정
	@PostMapping("/reply/edit")
	public ModelAndView editReply(Reply r) {
		ModelAndView mav = new ModelAndView("/Adopt/ReplyJson");
		replyService.editReply(r);
		r = replyService.getReply(r.getReply_num());
		System.out.println("댓글이 수정되었습니다." + r);
		mav.addObject("r", r);
		return mav;
	}

	// 댓글 삭제
	@RequestMapping("/reply/delete")
	public ModelAndView deleteReply(@RequestParam int reply_num) {
		ModelAndView mav = new ModelAndView("/Adopt/ReplyDelNum");
		Reply r = replyService.getReply(reply_num);
		int parent_reply_num = r.getParent_reply_num();
		// 대댓글이 있을 때 내용을 null로 변경
		if (r.getParent_reply_num() == -1) {
			ArrayList<Reply> child_reply = replyService.getListByParent_reply_num(reply_num);
			if (child_reply != null) {
				for (int i = 0; i < child_reply.size(); i++) {
					int num = child_reply.get(i).getReply_num();
					replyService.deleteReply(num);
				}
			}

		}
		replyService.deleteReply(reply_num);
		System.out.println("댓글이 삭제되었습니다.");
		mav.addObject("num", reply_num);
		mav.addObject("parent_reply_num", parent_reply_num);
		return mav;
	}

	@PostMapping("/reply/getReplyList")
	public ModelAndView getReplyList(@RequestParam(value = "board_num") int board_num) {
		ModelAndView mav = new ModelAndView("/Adopt/Reply");
		// 부모 댓글만 가져옴
		ArrayList<Reply> list = replyService.getReplyListByBoard_num(board_num);
		for (int i = 0; i < list.size(); i++) {
			Reply r = list.get(i);
			// 부모 댓글인 경우만 자식 댓글을 확인 후 저장
			int parent_reply_num = r.getReply_num();
			ArrayList<Reply> child_reply = replyService.getListByParent_reply_num(parent_reply_num);
			r.setChild_reply(child_reply);
		}
		mav.addObject("list", list);
		return mav;
	}
}