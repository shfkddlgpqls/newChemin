package com.kh.chemin.member.model.service;

import com.kh.chemin.member.model.vo.Member;

public interface MemberService {
	Member selectOne(String userId);
	int insertMember(Member member);
	Member checkEmail(String email);
	Member checkPhone(String phone);
	
}
