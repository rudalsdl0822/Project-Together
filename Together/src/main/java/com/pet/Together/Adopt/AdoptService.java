package com.pet.Together.Adopt;

import java.util.ArrayList;
import java.util.List;

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

	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	public int countAdopts() {
		return mapper.countAdopts();
	}
	public int countAdopt0() {
		return mapper.countAdopt0();
	}
	public int countAdopt1() {
		return mapper.countAdopt1();
	}
	public int countAdopt2() {
		return mapper.countAdopt2();
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

	/* ===============입양신청 DB 페이징 끝=============== */

}
