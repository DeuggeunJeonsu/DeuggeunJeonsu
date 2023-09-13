package com.jeonsu.deuggeun.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;

@Repository
public class jhjBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공지사항 게시글 삽입
	 * @param board
	 * @return result
	 */
	public int ncInsert(Board board) {
		return sqlSession.insert("boardMapper.ncInsert", board);
	}
}
