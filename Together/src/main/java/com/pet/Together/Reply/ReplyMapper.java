package com.pet.Together.Reply;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {

	void insert(Reply r);

	Reply select(int reply_num);

	ArrayList<Reply> selectListByBoard_num(int board_num);

	ArrayList<Reply> selectListByParent_reply_num(int parent_reply_num);

	void update(Reply r);

	void delete(int reply_num);

	int selectSeqCurrval();
}