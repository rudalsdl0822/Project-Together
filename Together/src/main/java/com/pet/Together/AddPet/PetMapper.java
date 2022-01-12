package com.pet.Together.AddPet;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetMapper {
	
	void addPet(Pet p);
	
	void editPet(Pet p);
	

	int makeId();
	
	
	/* ================================juDayoung 추가중================================ */
	Pet getPet(int id);
	/* ================================juDayoung 추가중 끝================================ */

	
	
	
	
	List selectPetAll();
	
	List selectByState(int state);
	
	
	
	
	void deletePet(int id);
	
	List selectByLocation(int location);
	
	List selectByState234();

	
}
