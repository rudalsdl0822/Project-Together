package com.pet.Together.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	public void addReview(Review r) {
		mapper.insert(r);
	}

	public Review getReviewByNum(int num) {
		return mapper.selectByNum(num);
	}

	public List selectAll() {
		return mapper.selectAll();
	}

	public void editReview(Review r) {
		mapper.update(r);
	}

	public void delReview(int num) {
		mapper.delete(num);
	}

	public int getNum() {
		return mapper.getNum();
	}
}
