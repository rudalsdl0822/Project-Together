package com.pet.Together.Adopt;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdoptMapper {
	
	void addAdopt(Adopt adopt);
	Adopt getAdopt(int num);
	ArrayList<Adopt> getAdopts();
	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	int countAdopt();
	List<Adopt> selectAdopt(PagingVO vo);
	/* ===============입양신청 DB 페이징 끝=============== */


}
