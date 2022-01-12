package com.pet.Together.Ask;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AskService {

	@Autowired
	private AskMapper mapper;

	int makeNum() {
		return mapper.makeNum();
	};

	void addAsk(Ask ask) {
		mapper.addAsk(ask);
	};

	Ask getAsk(int num) {
		return mapper.getAsk(num);
	};

	void delAsk(int num) {
		mapper.delAsk(num);
	};

	ArrayList<Ask> getAskByWriter(String writer_id) {
		return mapper.getAskByWriter(writer_id);
	};

	void editAsk(Ask ask) {
		mapper.editAsk(ask);
	};

	ArrayList<Ask> getAllAsk() {
		return mapper.getAllAsk();
	};

	ArrayList<Ask> getAskByCategory(int category) {
		return mapper.getAskByCategory(category);
	};

}
