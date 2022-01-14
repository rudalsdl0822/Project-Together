package com.pet.Together.ReviewReply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.Together.Member.MemberService;

@Service
public class ReviewReplyService {

	@Autowired
	private ReviewReplyMapper mapper;
	@Autowired
	private MemberService memberService;

//	댓글 추가
	public void addReply(ReviewReply r) {
		mapper.insert(r);
		r.setReply_num(mapper.selectSeqCurrval());
	}

//	댓글내용 가져오기
	public ReviewReply getReply(int reply_num) {
//		한개의 댓글내용
		ReviewReply r = mapper.select(reply_num);

//		대댓글 목록
		ArrayList<ReviewReply> replyList = getListByParent_reply_num(reply_num);
		for (int i = 0; i < replyList.size(); i++) {
			ReviewReply cReply = replyList.get(i);
			cReply.setMember(memberService.getMember(cReply.getWriter_id()));
			replyList.set(i, cReply);
		}
		r.setChild_reply(replyList);
		r.setMember(memberService.getMember(r.getWriter_id()));
		return r;
	}

//	게시글번호 댓글 가져오기
	public ArrayList<ReviewReply> getReplyListByBoard_num(int board_num) {
		ArrayList<ReviewReply> list = mapper.selectListByBoard_num(board_num);
		for (int i = 0; i < list.size(); i++) {
			list.set(i, getReply(list.get(i).getReply_num()));
//			부모가 없는 댓글만 리스트에 넣음
			if (list.get(i).getParent_reply_num() != -1) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}
	
//	작성자의 댓글목록
	public ArrayList<ReviewReply> getReplyListByWriter_id(String writer_id) {
		return mapper.selectListByWriter_id(writer_id);
	}
	
//	대댓글만 가져오기
	public ArrayList<ReviewReply> getListByParent_reply_num(int parent_reply_num) {
		return mapper.selectListByParent_reply_num(parent_reply_num);
	}
	
//	댓글 수정
	public void editReply(ReviewReply r) {
		mapper.update(r);
	}
	
//	댓글 삭제
	public void deleteReply(int reply_num) {
		mapper.delete(reply_num);
	}
	
	public void deleteParentReply(int reply_num) {
		mapper.deleteParent(reply_num);
	}
	
//	현재 번호
	public int getSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
}