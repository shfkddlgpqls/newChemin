package com.kh.chemin.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Override
	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		System.out.println(userId);
		return sqlSession.selectOne("member.selectOne", userId);
	}
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertMember",member);
	}
	@Override
	public Member checkEmail(SqlSessionTemplate sqlSession, String email) {
		System.out.println(email);
		return sqlSession.selectOne("member.checkEmail", email);
	}
	@Override
	public Member checkPhone(SqlSessionTemplate sqlSession, String phone) {
		System.out.println(phone);
		return sqlSession.selectOne("member.checkphone", phone);
	}
}