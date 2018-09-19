package com.kh.chemin.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.member.model.vo.Member;

public interface MemberDao {
	
	Member selectOne(SqlSessionTemplate sqlSession, String userId);

	Member selectFindId(SqlSessionTemplate sqlSession, Map<String, String> map);

	Member selectFindPw(SqlSessionTemplate sqlSession, Map<String, String> map);

	int updatePw(SqlSessionTemplate sqlSession, Map<String, String> map);
}
