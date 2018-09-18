package com.kh.chemin.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.member.model.vo.Member;

public interface MemberDao {
   
   Member selectOne(SqlSessionTemplate sqlSession, String userId);
   int insertMember(SqlSessionTemplate sqlSession, Member member);
   Member checkEmail(SqlSessionTemplate sqlSession,String email);
   Member checkPhone(SqlSessionTemplate sqlSession, String phone);
   
}