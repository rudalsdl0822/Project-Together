package com.pet.Together.Adopt;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public void editAdopt(Adopt adopt) {
		mapper.editAdopt(adopt);
	}

	public void deleteAdopt(int num) {
		mapper.deleteAdopt(num);
	}
	
	
	public ArrayList<Adopt> getAdoptsByPet_id(int pet_id){
		return mapper.getAdoptsByPet_id(pet_id);
	}
	
	public ArrayList<Adopt> getAdoptsByWriter(@Param("writer")String writer, @Param("state") int state){
		return mapper.getAdoptsByWriter(writer, state);
	}
	
	public ArrayList<Adopt> getAdoptsAllByWriter(@Param("writer")String writer){
		return mapper.getAdoptsAllByWriter(writer);
	}
	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	public int countAdopts() {
		return mapper.countAdopts();
	}
	
	public int countAdoptsByState(int state) {
		return mapper.countAdoptsByState(state);
	}
	
	
	public List<Adopt> selectAdopts(PagingVO vo){
		return mapper.selectAdopts(vo);
	}
	
	public List<Adopt> selectAdopt0(PagingVO vo){
		return mapper.selectAdopt0(vo);
	}
	public List<Adopt> selectAdopt1(PagingVO vo){
		return mapper.selectAdopt1(vo);
	}
	public List<Adopt> selectAdopt2(PagingVO vo){
		return mapper.selectAdopt2(vo);
	}

	
	public List<Adopt> selectAdoptByState(PagingVO vo,  int state){
		return mapper.selectAdoptByState(vo, state);
	}
	/* ===============입양신청 DB 페이징 끝=============== */

}
