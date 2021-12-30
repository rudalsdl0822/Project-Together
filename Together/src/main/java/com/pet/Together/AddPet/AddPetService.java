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
	
	

}
