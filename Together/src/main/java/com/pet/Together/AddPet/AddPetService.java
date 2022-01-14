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

	public List getLocationList(int location) {
		return mapper.selectByLocation(location);
	}
	
	public List getState234() {
		return mapper.selectByState234();
	}

	
	public void editPetState(Pet p) {
		mapper.editPetState(p);
	}
	
	
	
}
