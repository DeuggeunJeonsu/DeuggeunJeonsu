package com.jeonsu.deuggeun.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

}
