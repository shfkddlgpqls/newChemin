package com.kh.chemin.member.model.service;

import com.kh.chemin.member.model.vo.Member;

public interface MemberService {
	Member selectOne(String userId);
	
}
