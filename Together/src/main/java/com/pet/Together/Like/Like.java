package com.pet.Together.Like;

import java.sql.Date;

public class Like {

	private int like_num;
	private String id;
	private int pet_id;
	private Date like_date;

	public Like() {
		super();
	}

	public Like(int like_num, String id, int pet_id, Date like_date) {
		super();
		this.like_num = like_num;
		this.id = id;
		this.pet_id = pet_id;
		this.like_date = like_date;
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

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}

	@Override
	public String toString() {
		return "Like [like_num=" + like_num + ", id=" + id + ", pet_id=" + pet_id + ", like_date=" + like_date + "]";
	}


	
}