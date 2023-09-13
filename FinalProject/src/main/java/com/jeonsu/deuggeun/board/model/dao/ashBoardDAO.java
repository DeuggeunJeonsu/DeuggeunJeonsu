package com.jeonsu.deuggeun.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Hashtag;

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

	public int hashtagInsert(int boardNo, List<String> tagContent) {
		
		int result=0;
		
		for( int i=0; i<tagContent.size(); i++) {
			
			Hashtag hashtag = new Hashtag();
			
			hashtag.setTagContent(tagContent.get(i));
			
			result += sqlSession.insert("boardMapper.hashtagInsert", hashtag);
		}
		
		return result;
	}

}
