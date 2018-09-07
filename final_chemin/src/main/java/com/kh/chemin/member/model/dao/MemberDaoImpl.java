package com.kh.chemin.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		System.out.println(userId);
		return sqlSession.selectOne("member.selectOne", userId);
	}
}