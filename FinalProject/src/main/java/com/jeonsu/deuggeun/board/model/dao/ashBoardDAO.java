package com.jeonsu.deuggeun.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;

@Repository
public class ashBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int boardInsert(Board board) {
		return sqlSession.insert("boardMapper.freeBoardInsert", board);
	}
}
