package com.pet.Together.AddPet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddPetService {
	
	@Autowired
	private PetMapper mapper;
	
	public void addPet(Pet p) {
		mapper.addPet(p);
	}
	
	public int makeId() {
		return mapper.makeId();
	}
	
	
	public Pet getPet(int id) {
		return mapper.getPet(id); 
	}
	public void editPet(Pet p) {
		mapper.editPet(p);
	}


	
	public List getPetAllList() {
		return mapper.selectPetAll();
	}
	
	public List getStateList(int state) {
		return mapper.selectByState(state);
	}
	
	
	
	
	public void deletePet(int id) {
		mapper.deletePet(id);
	}

	public List getLocation(int location) {
		return mapper.selectByLocation(location);
	}

	
	
	
	public List getLocationState23(int location) {
		return mapper.selectByLocaState23(location);
	}
	
	public List getState23() {
		return mapper.selectByState23();
	}
	
	
	
	
	public List getAgeList(String age) {
		return mapper.selectByAge(age);
	}
	
	public List getBreed(String breed) {
		return mapper.selectByBreed(breed);
	}

	public List getPetName(String name) {
		return mapper.selectByPetName(name);
	}
	
	public List getWriter_id(String writer_id) {
		return mapper.selectByWriter_id(writer_id);
	}
	

	
	public void editPetState(Pet p) {
		mapper.editPetState(p);
	}
	
	
	
}
