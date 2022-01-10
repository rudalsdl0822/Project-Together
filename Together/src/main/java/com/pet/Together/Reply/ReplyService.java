package com.pet.Together.Reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.Together.Member.MemberService;


@Service
public class ReplyService {

	@Autowired
	private ReplyMapper mapper;
	@Autowired
	private MemberService memberService;

//	댓글 추가
	public void addReply(Reply r) {
		mapper.insert(r);
		r.setReply_num(mapper.selectSeqCurrval());
	}

// 댓글 내용 가져오기
	public Reply getReply(int reply_num) {
//		한개의 댓글 내용
		Reply r = mapper.select(reply_num);
//		댓글의 자식 댓글 목록
		ArrayList<Reply> replyList = getListByParent_reply_num(reply_num);
		for (int i = 0; i < replyList.size(); i++) {
			Reply rReply = replyList.get(i);
			rReply.setMember(memberService.getMember(rReply.getWriter_id()));
			replyList.set(i, rReply);
		}
		r.setChild_reply(replyList);
		r.setMember(memberService.getMember(r.getWriter_id()));
		return r;
	}

//	게시판번호 댓글 가져오기
	public ArrayList<Reply> getReplyListByPet_id(int board_num) {
		ArrayList<Reply> list = mapper.selectListByBoard_num(board_num);
		for (int i = 0; i < list.size(); i++) {
			list.set(i, getReply(list.get(i).getReply_num()));
//			부모가 없는 댓글만 리스트에 넣는다.
			if (list.get(i).getParent_reply_num() != -1) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}

//	작성자의 댓글 목록
	public ArrayList<Reply> getReplyListByWriter_id(String writer_id) {
		return mapper.selectListByWriter_id(writer_id);
	}

//	댓글의 하위 댓글만 가져오기
	private ArrayList<Reply> getListByParent_reply_num(int parent_reply_num) {
		return mapper.selectListByParent_reply_num(parent_reply_num);
	}

//	댓글 수정
	public void editReply(Reply r) {
		mapper.update(r);
	}

//	댓글 삭제
	public void deleteReply(int reply_num) {
		mapper.delete(reply_num);
	}

	public void deleteParentReply(int reply_num) {
		mapper.deleteParent(reply_num);
	}

	// 현재 번호
	public int getSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
}
