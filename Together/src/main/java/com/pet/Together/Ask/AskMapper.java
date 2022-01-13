package com.pet.Together.Ask;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AskMapper {

	int makeNum();

	void addAsk(Ask ask);

	Ask getAsk(int num);

	void delAsk(int num);

	ArrayList<Ask> getAskByWriter(String writer_id);

	void editAsk(Ask ask);

	ArrayList<Ask> getAllAsk();

	ArrayList<Ask> getAskByCategory(int category);

}
