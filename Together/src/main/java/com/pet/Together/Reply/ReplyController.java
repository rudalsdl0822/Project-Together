package com.pet.Together.Reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@PostMapping("/reply/add")
	public String addReply(Reply r) {
		//r.setWriter_id((String) session.getAttribute("id"));
		replyService.addReply(r);
		System.out.println("댓글이 입력되었습니다. "+r);
		
		return "redirect:/Adopt/WaitingPet?id="+r.getBoard_num();
	}
	
	@PostMapping("/reply/edit")
	public String editReply(Reply r) {
		String writer_id = (String)session.getAttribute("id");
		r.setWriter_id(writer_id);
		replyService.editReply(r);
		return "redirect:" + request.getHeader("REFERER") + "#reply-" + r.getReply_num();
	}
	
//	댓글 삭제
	@RequestMapping("/reply/delete")
	public String deleteReply(@RequestParam int reply_num) {
		String writer_id = (String) session.getAttribute("id");
		Reply r = replyService.getReply(reply_num);
		if(writer_id.equals(r.getWriter_id())) {
//			하위 댓글이 있을 때 내용을 null로 변경한다.
			if(r.getChild_reply().size() != 0 || r.getParent_reply_num() != -1) {
				replyService.deleteParentReply(reply_num);
			} else {
//				없을 때는 삭제
				replyService.deleteReply(reply_num);
			}
		}
		return "redirect:" + request.getHeader("REFERER");
	}
}