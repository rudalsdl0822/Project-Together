package com.pet.Together.Ask;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnswerMapper {

	void addAnswer(Answer answer);
	
	Answer getAnswerByAskNum(int ask_num);

	void delAnswer(int ask_num);	

	void editAnswer(Answer answer);
}
