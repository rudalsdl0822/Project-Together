package com.pet.Together.Member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	void insert(Member m);

	Member select(String id);
	
	Member selectByNickname(String nickname);

	void update(Member m);

	void delete(String id);
}
