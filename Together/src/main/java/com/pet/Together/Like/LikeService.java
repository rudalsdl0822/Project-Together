package com.pet.Together.Like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	@Autowired
	private LikeMapper mapper;

	public void insertLike(Like l) {
		mapper.insertLike(l);
	}

	public List selectById(String id) {
		return mapper.selectById(id);
	}

	public List selectByPetId(int pet_id) {
		return mapper.selectByPetId(pet_id);
	}

	public void deleteLike(int like_num) {
		mapper.deleteLike(like_num);
	}

	public void deleteAllLike(String id) {
		mapper.deleteAllLike(id);
	}

	public void deleteLikeByPetId(int pet_id, String id) {
		mapper.deleteLikeByPetId(id, pet_id);
	}

	public Like selectByIdPetId(int pet_id, String id) {
		return mapper.selectByIdPetId(id, pet_id);
	}

	public int getNum() {
		return mapper.getNum();
	}
}