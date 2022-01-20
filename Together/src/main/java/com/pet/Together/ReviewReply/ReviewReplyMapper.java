package com.pet.Together.ReviewReply;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewReplyMapper {
	
	void insert(ReviewReply r);
	
	ReviewReply select(int reply_num);
	
	ArrayList<ReviewReply> selectListByBoard_num(int board_num);
	
	ArrayList<ReviewReply> selectListByParent_reply_num(int parent_reply_num);
	
	void update(ReviewReply r);
	
	void delete(int reply_num);
	
	int selectSeqCurrval();
}
