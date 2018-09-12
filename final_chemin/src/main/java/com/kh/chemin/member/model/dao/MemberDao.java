package com.kh.chemin.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.member.model.vo.Member;

public interface MemberDao {
	
	Member selectOne(SqlSessionTemplate sqlSession, String userId);
}
