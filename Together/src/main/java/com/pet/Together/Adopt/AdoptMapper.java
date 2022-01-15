package com.pet.Together.Adopt;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdoptMapper {
	
	void addAdopt(Adopt adopt);
	Adopt getAdopt(int num);
	ArrayList<Adopt> getAdopts();
	void editAdopt(Adopt adopt);
	void deleteAdopt(int num);
	
	ArrayList<Adopt> getAdoptsByPet_id(int pet_id);
	ArrayList<Adopt> getAdoptsByPet_idState(Adopt adopt);
	
	ArrayList<Adopt> getAdoptsByWriter(@Param("writer")String writer, @Param("state") int state);
	ArrayList<Adopt> getAdoptsAllByWriter(@Param("writer")String writer);
	
	
	
	/* ===============입양신청 DB 페이징 시작=============== */
	int countAdopts();	
	int countAdoptsByState(int state);
	int countAdoptsByPet_idState(Adopt adopt);
	
	
	List<Adopt> selectAdopts(PagingVO vo);
	
	List<Adopt> selectAdoptByState(@Param("state") int state, @Param("start") int start, @Param("end") int end);
	List<Adopt> selectAdoptByPet_idState(Adopt adopt, @Param("start") int start, @Param("end") int end);
	/* ===============입양신청 DB 페이징 끝=============== */


}
