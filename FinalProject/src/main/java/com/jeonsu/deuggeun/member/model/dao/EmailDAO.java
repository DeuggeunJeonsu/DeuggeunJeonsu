package com.jeonsu.deuggeun.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("EmailMapper.updateAuthKey", map);
	}

	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.update("EmailMapper.insertAuthKey", map);
	}

	public int cehckAuthKey(Map<String, Object> paramMap) {
		return sqlSession.selectOne("EmailMapper.checkAuthKey", paramMap);
	}

}
