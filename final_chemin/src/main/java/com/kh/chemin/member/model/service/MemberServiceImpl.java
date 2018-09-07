package com.kh.chemin.member.model.service;

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

}
