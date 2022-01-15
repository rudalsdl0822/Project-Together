package com.pet.Together.AddPet;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetMapper {
	
	void addPet(Pet p);
	
	void editPet(Pet p);
	

	int makeId();
	
	Pet getPet(int id);

	
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

	
	

	void editPetState(Pet p);
	

}
