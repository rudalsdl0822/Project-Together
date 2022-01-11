package com.pet.Together.Like;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LikeMapper {

	void insertLike(Like l);

	@SuppressWarnings("rawtypes")
	List selectLikeNum(int like_num);

	@SuppressWarnings("rawtypes")
	List selectById(String id);

	@SuppressWarnings("rawtypes")
	List selectByPetId(int pet_id);

	Like selectByIdPetId(@Param("id") String id, @Param("pet_id") int pet_id);

	void deleteLike(int like_num);

	void deleteAllLike(String id);

	void deleteLikeByPetId(@Param("id") String id, @Param("pet_id") int pet_id);

	int getNum();

}