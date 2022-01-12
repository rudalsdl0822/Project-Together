package com.pet.Together.Review;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private int num;
	private String w_writer;
	private String title;
	private int location;
	private String content;
	private Date w_date;

	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;

	public Review() {
		super();
	}

	public Review(int num, String w_writer, String title, int location, String content, Date w_date,
			MultipartFile file1, MultipartFile file2, MultipartFile file3) {
		super();
		this.num = num;
		this.w_writer = w_writer;
		this.title = title;
		this.location = location;
		this.content = content;
		this.w_date = w_date;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getW_writer() {
		return w_writer;
	}

	public void setW_writer(String w_writer) {
		this.w_writer = w_writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	@Override
	public String toString() {
		return "Review [num=" + num + ", w_writer=" + w_writer + ", title=" + title + ", location=" + location
				+ ", content=" + content + ", w_date=" + w_date + ", file1=" + file1 + ", file2=" + file2 + ", file3="
				+ file3 + "]";
	}

}
