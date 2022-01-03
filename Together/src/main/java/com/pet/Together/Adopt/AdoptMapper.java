package com.pet.Together.Adopt;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdoptMapper {
	
	void addAdopt(Adopt adopt);
	Adopt getAdopt(int num);
	ArrayList<Adopt> getAdopts();


}
