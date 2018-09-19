package com.kh.chemin.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.member.model.dao.MemberDao;
import com.kh.chemin.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public Member selectOne(String userId) {
		System.out.println(userId);
		return dao.selectOne(sqlSession,userId);
	}


	@Override
	public Member selectFindId(Map<String, String> map) {
		return dao.selectFindId(sqlSession, map);
	}


	@Override
	public Member selectFindPw(Map<String, String> map) {
		return dao.selectFindPw(sqlSession, map);
	}


	@Override
	public int updatePw(Map<String, String> map) {
		return dao.updatePw(sqlSession, map);
	}

}
