package com.kh.chemin.member.model.service;

import java.util.Map;

import com.kh.chemin.member.model.vo.Member;

public interface MemberService {
	Member selectOne(String userId);

	Member selectFindId(Map<String, String> map);

	Member selectFindPw(Map<String, String> map);

	int updatePw(Map<String, String> map);
	
   int insertMember(Member member);
   Member checkEmail(String email);
   Member checkPhone(String phone);
   int memberInfoUpdate(Member mebmer);
   int memberWithdraw(Map map);
}

