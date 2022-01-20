package com.pet.Together.Reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	@Autowired
	private ReplyMapper mapper;

	// 댓글 추가
	public void addReply(Reply r) {
		mapper.insert(r);
		r.setReply_num(mapper.selectSeqCurrval());
	}

	// 댓글내용 가져오기
	public Reply getReply(int reply_num) {
		// 한개의 댓글내용
		Reply r = mapper.select(reply_num);
		// 대댓글 목록에 저장
		ArrayList<Reply> replyList = getListByParent_reply_num(reply_num);
		if (replyList != null) {
			r.setChild_reply(replyList);
		}
		return r;
	}

	// 게시글번호 댓글 가져오기
	public ArrayList<Reply> getReplyListByBoard_num(int board_num) {
		// 게시글번호가 board_num이고 부모댓값이 -1인 부모댓글들만 검색
		ArrayList<Reply> list = mapper.selectListByBoard_num(board_num);

		return list;
	}

	// 대댓글만 가져오기
	public ArrayList<Reply> getListByParent_reply_num(int parent_reply_num) {
		return mapper.selectListByParent_reply_num(parent_reply_num);
	}

	// 댓글 수정
	public void editReply(Reply r) {
		mapper.update(r);
	}

	// 댓글 삭제
	public void deleteReply(int reply_num) {
		mapper.delete(reply_num);
	}

	// 현재 번호
	public int getSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
}