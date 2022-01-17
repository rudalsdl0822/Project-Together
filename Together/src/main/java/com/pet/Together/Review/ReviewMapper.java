package com.pet.Together.Review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	void insert(Review r);

	Review selectByNum(int num);
	
	List selectByNickname(String w_writer);

	List selectAll();

	void update(Review r);

	void delete(int num);

	int getNum();
}
