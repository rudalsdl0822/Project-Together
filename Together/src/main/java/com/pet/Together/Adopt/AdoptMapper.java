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
	int countAdopts();
	int countAdopt0();
	int countAdopt1();
	int countAdopt2();
	
	
	List<Adopt> selectAdopts(PagingVO vo);
	// state 0: 입양신청중 1: 입양승인 2: 입양거절
	List<Adopt> selectAdopt0(PagingVO vo);
	List<Adopt> selectAdopt1(PagingVO vo);
	List<Adopt> selectAdopt2(PagingVO vo);
	/* ===============입양신청 DB 페이징 끝=============== */


}
