package com.pet.Together.Adopt;

public class Adopt {

	private int num;
	private String title;
	private String writer;
	private int pet_id;
	private String family;
	private String job;
	private String walktime;
	private int dating;
	private String content;

	public Adopt(int num, String title, String writer, int pet_id, String family, String job, String walktime,
			int dating, String content) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.pet_id = pet_id;
		this.family = family;
		this.job = job;
		this.walktime = walktime;
		this.dating = dating;
		this.content = content;
	}

	public Adopt() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPet_id() {
		return pet_id;
	}

	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getWalktime() {
		return walktime;
	}

	public void setWalktime(String walktime) {
		this.walktime = walktime;
	}

	public int getDating() {
		return dating;
	}

	public void setDating(int dating) {
		this.dating = dating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Adopt [num=" + num + ", title=" + title + ", writer=" + writer + ", pet_id=" + pet_id + ", family="
				+ family + ", job=" + job + ", walktime=" + walktime + ", dating=" + dating + ", content=" + content
				+ "]";
	}

}
