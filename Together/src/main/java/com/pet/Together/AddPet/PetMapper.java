package com.pet.Together.AddPet;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetMapper {
	
	void addPet(Pet p);
	
	void editPet(Pet p);
	
	
	
	/* ================================juDayoung 추가중================================ */
	Pet getPet(int id);
	/* ================================juDayoung 추가중 끝================================ */

}
