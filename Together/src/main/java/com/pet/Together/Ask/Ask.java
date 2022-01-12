package com.pet.Together.Ask;

import com.pet.Together.AddPet.Img;

public class Ask {
	private int num; // 시퀀스 번호, 문의글 식별 변호
	private String writer_id; // 문의글 작성자
	private int category; // 문의글 유형 (1. 회원정보, 2. 입양 관련, 3. 입소 관련, 4. 사이트 관련 오류, 5. 후원 관련)
	private String title; // 문의글 제목
	private String content; // 문의글 내용
	private Img imgs; // 사진 첨부 (선택사항)
	private Answer answer; // 관리자의 답변

	public Ask() {
		super();
	}

	public Ask(int num, String writer_id, int category, String title, String content, Answer answer) {
		super();
		this.num = num;
		this.writer_id = writer_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.answer = answer;
	}

	public Ask(int num, String writer_id, int category, String title, String content, Img imgs, Answer answer) {
		super();
		this.num = num;
		this.writer_id = writer_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.imgs = imgs;
		this.answer = answer;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Img getImgs() {
		return imgs;
	}

	public void setImgs(Img imgs) {
		this.imgs = imgs;
	}

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Ask [num=" + num + ", writer_id=" + writer_id + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", imgs=" + imgs + ", answer=" + answer + "]";
	}

}
