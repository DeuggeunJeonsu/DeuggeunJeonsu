package com.jeonsu.deuggeun.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;

@Repository
public class ashBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 자유게시판 게시글 삽입
	 * @param board
	 * @return boardNo(result)
	 */
	public int boardInsert(Board board) {
		int result = sqlSession.insert("boardMapper.freeBoardInsert", board);
		
		if(result > 0) result = board.getBoardNo();
		
		return result;
	}

//	public int hashTagInsert(int boardNo, List<String> tagContents) {
//		return sqlSession.insert("boardMapper.hashTagInsert", tagContents);
//	}
}
