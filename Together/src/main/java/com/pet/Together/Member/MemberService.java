package com.pet.Together.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	public void addMember(Member m) {
		mapper.insert(m);
	}

	public Member getMember(String id) {
		return mapper.select(id);
	}
	
	public Member getMemberByNickname(String nickname) {
		return mapper.selectByNickname(nickname);
	}

	public void editMember(Member m) {
		mapper.update(m);
	}

	public void delMember(String id) {
		mapper.delete(id);
	}

}
