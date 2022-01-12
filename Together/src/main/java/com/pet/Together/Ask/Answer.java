package com.pet.Together.Ask;

import java.sql.Date;

public class Answer {
	private int ans_num;
	private String admin_id;
	private String ans_content;
	private Date ans_date;
	private int ask_num;

	public Answer() {
		super();
	}

	public Answer(int ans_num, String admin_id, String ans_content, Date ans_date, int ask_num) {
		super();
		this.ans_num = ans_num;
		this.admin_id = admin_id;
		this.ans_content = ans_content;
		this.ans_date = ans_date;
		this.ask_num = ask_num;
	}

	public int getAns_num() {
		return ans_num;
	}

	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAns_content() {
		return ans_content;
	}

	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}

	public Date getAns_date() {
		return ans_date;
	}

	public void setAns_date(Date ans_date) {
		this.ans_date = ans_date;
	}

	public int getAsk_num() {
		return ask_num;
	}

	public void setAsk_num(int ask_num) {
		this.ask_num = ask_num;
	}

	@Override
	public String toString() {
		return "Answer [ans_num=" + ans_num + ", admin_id=" + admin_id + ", ans_content=" + ans_content + ", ans_date="
				+ ans_date + ", ask_num=" + ask_num + "]";
	}

}
