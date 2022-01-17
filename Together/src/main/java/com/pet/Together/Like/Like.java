package com.pet.Together.Like;

import com.pet.Together.AddPet.Pet;

public class Like {

	private int like_num;
	private String id;
	private int pet_id;
	private Pet p;

	public Like() {
		super();
	}

	public Like(int like_num, String id, int pet_id, Pet p) {
		super();
		this.like_num = like_num;
		this.id = id;
		this.pet_id = pet_id;
		this.p = p;
	}



	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPet_id() {
		return pet_id;
	}

	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}

	public Pet getP() {
		return p;
	}

	public void setP(Pet p) {
		this.p = p;
	}



	@Override
	public String toString() {
		return "Like [like_num=" + like_num + ", id=" + id + ", pet_id=" + pet_id + ", p=" + p + "]";
	}

	
}