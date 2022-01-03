package com.pet.Together.Adopt;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.Together.AddPet.AddPetService;
import com.pet.Together.AddPet.Pet;
import com.pet.Together.AddPet.PetMapper;

@Service
public class AdoptService {

	@Autowired
	private AdoptMapper mapper;

	public void addAdopt(Adopt adopt) {
		mapper.addAdopt(adopt);
	}

	public Adopt getAdopt(int num) {
		return mapper.getAdopt(num);
	}

	public ArrayList<Adopt> getAdopts() {
		return mapper.getAdopts();
	}
	

	
	
	
	/* ===================함수 시작===================================== */

	
	/* ===================함수 끝===================================== */

}
