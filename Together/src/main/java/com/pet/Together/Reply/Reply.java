package com.pet.Together.Reply;

import java.sql.Date;
import java.util.ArrayList;

import com.pet.Together.Member.Member;

public class Reply {

	private int reply_num;
	private int board_num;
	private String writer_id;
	private String reply_content;
	private Date reply_date;
	private int parent_reply_num;
	private ArrayList<Reply> child_reply;
	private Member member;

	public Reply() {
		super();
	}

	public Reply(int reply_num, int board_num, String writer_id, String reply_content, Date reply_date,
			int parent_reply_num, ArrayList<Reply> child_reply, Member member) {
		super();
		this.reply_num = reply_num;
		this.board_num = board_num;
		this.writer_id = writer_id;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.parent_reply_num = parent_reply_num;
		this.child_reply = child_reply;
		this.member = member;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getParent_reply_num() {
		return parent_reply_num;
	}

	public void setParent_reply_num(int parent_reply_num) {
		this.parent_reply_num = parent_reply_num;
	}

	public ArrayList<Reply> getChild_reply() {
		return child_reply;
	}

	public void setChild_reply(ArrayList<Reply> child_reply) {
		this.child_reply = child_reply;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", board_num=" + board_num + ", writer_id=" + writer_id
				+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + ", parent_reply_num="
				+ parent_reply_num + ", child_reply=" + child_reply + ", member=" + member + "]";
	}
}