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

	
	
	List selectByLocaState23(int location);
	
	List selectByState23();
	
	
	
	
	List selectByAge(String age);
	
	List selectByBreed(String breed);
	
	List selectByPetName(String name);
	
	List selectByWriter_id(String writer_id);

	
	
}
