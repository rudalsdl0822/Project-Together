package com.pet.Together.Adopt;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.Together.AddPet.AddPetService;

@Service
public class AdoptService {
	
	@Autowired
	private AddPetService pet_service;

	@Autowired
	private AdoptMapper mapper;

	public void addAdopt(Adopt adopt) {
		mapper.addAdopt(adopt);
	}

	public Adopt getAdopt(int num) {
		Adopt adopt=mapper.getAdopt(num);
		adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		return adopt;
	}

	public ArrayList<Adopt> getAdopts() {
		ArrayList<Adopt> adoptList=mapper.getAdopts();
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	public void editAdopt(Adopt adopt) {
		mapper.editAdopt(adopt);
	}

	public void deleteAdopt(int num) {
		mapper.deleteAdopt(num);
	}
	
	
	public ArrayList<Adopt> getAdoptsByPet_id(int pet_id){
		ArrayList<Adopt> adoptList= mapper.getAdoptsByPet_id(pet_id);
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	public ArrayList<Adopt> getAdoptsByPet_idState(Adopt adopt){
		ArrayList<Adopt> adoptList= mapper.getAdoptsByPet_idState(adopt);
		for(Adopt one_adopt: adoptList) {
			one_adopt.setPet(pet_service.getPet(one_adopt.getPet_id()));
		}
		return adoptList;
	}
	
	
	public ArrayList<Adopt> getAdoptsByPet_idState(int pet_id, int state){
		ArrayList<Adopt> adoptList= mapper.getAdoptsByPet_id(pet_id);
		ArrayList<Adopt> new_adoptList=new ArrayList<>();
		for(Adopt adopt: adoptList) {
			if(adopt.getState()==state) {
				adopt.setPet(pet_service.getPet(adopt.getPet_id()));
				new_adoptList.add(adopt);
			}			
		}
		return new_adoptList;
	}
	
	
	public ArrayList<Adopt> getAdoptsByWriter(@Param("writer")String writer, @Param("state") int state){
		ArrayList<Adopt> adoptList= mapper.getAdoptsByWriter(writer, state);
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	public ArrayList<Adopt> getAdoptsAllByWriter(@Param("writer")String writer){
		ArrayList<Adopt> adoptList= mapper.getAdoptsAllByWriter(writer);
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	public int countAdopts() {
		return mapper.countAdopts();
	}
	
	public int countAdoptsByState(int state) {
		return mapper.countAdoptsByState(state);
	}
	public int countAdoptsByPet_id(int pet_id) {
		return mapper.countAdoptsByPet_id(pet_id);
	}
	
	public int countAdoptsByPet_idState(Adopt adopt) {
		return mapper.countAdoptsByPet_idState(adopt);
	}
	
	
	public List<Adopt> selectAdopts(PagingVO vo){
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) mapper.selectAdopts(vo);
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	public List<Adopt> selectAdoptByState(int state, int start, int end){
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) mapper.selectAdoptByState(state, start, end);
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	public List<Adopt> selectAdoptByPet_id(int pet_id, PagingVO vo){
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) mapper.selectAdoptByPet_id(pet_id, vo.getStart(), vo.getEnd());
		for(Adopt adopt: adoptList) {
			adopt.setPet(pet_service.getPet(adopt.getPet_id()));
		}
		return adoptList;
	}
	
	public List<Adopt> selectAdoptByPet_idState(Adopt adopt, PagingVO vo){
		ArrayList<Adopt> adoptList=(ArrayList<Adopt>) mapper.selectAdoptByPet_idState(adopt.getPet_id(), adopt.getState(), vo.getStart(), vo.getEnd());
		for(Adopt one_adopt: adoptList) {
			one_adopt.setPet(pet_service.getPet(one_adopt.getPet_id()));
		}
		return adoptList;
	}
	/* ===============입양신청 DB 페이징 끝=============== */

}
