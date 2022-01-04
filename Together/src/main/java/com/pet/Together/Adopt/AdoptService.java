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
	

	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	public int countAdopt() {
		return mapper.countAdopt();
	}
	public List<Adopt> selectAdopt(PagingVO vo){
		return mapper.selectAdopt(vo);
	}
	/* ===============입양신청 DB 페이징 끝=============== */

}
