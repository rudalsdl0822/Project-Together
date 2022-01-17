package com.pet.Together.Ask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {

	@Autowired
	private AnswerMapper mapper;
	
	public void addAns(Answer answer) {
		mapper.addAnswer(answer);
	}
	
	public Answer getAns(int ask_num) {
		return mapper.getAnswerByAskNum(ask_num);
	}

	public void delAns(int ask_num) {
		mapper.delAnswer(ask_num);
	}

	public void editAns(Answer answer) {
		mapper.editAnswer(answer);
	}
}
