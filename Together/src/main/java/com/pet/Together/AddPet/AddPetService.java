package com.pet.Together.AddPet;

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
	
	
	/* ================================juDayoung 추가중================================ */
	public Pet getPet(int id) {
		return mapper.getPet(id); 
	}
	/* ================================juDayoung 추가중 끝================================ */

}
