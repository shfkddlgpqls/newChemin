package com.kh.chemin.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		System.out.println(userId);
		return sqlSession.selectOne("member.selectOne", userId);
	}

	@Override
	public Member selectFindId(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectFindId", map);
	}

	@Override
	public Member selectFindPw(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectFindPw", map);
	}

	@Override
	public int updatePw(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("member.updatePw", map);
	}
	
}