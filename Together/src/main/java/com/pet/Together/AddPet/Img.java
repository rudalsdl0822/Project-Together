package com.pet.Together.AddPet;

import org.springframework.web.multipart.MultipartFile;

public class Img {

	MultipartFile file1;
	MultipartFile file2;
	MultipartFile file3;

	public Img(MultipartFile file1, MultipartFile file2, MultipartFile file3) {
		super();
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
	}

	public Img() {
		super();
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
		return "Img [file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + "]";
	}

}
