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

	/** 자유게시판 해시태그 삽입
	 * @param boardNo
	 * @param tagContent
	 * @return boardNo(result)
	 */
	public int hashtagInsert(int boardNo, List<String> tagContent) {
		
		// 1. BOARD_HASHTAG 테이블 삽입
		
		// hashtagInsert sql문 결과 저장용 변수
		int result = 0;
		
		List<Hashtag> tagList = new ArrayList<Hashtag>();
		
		for(int i=0; i<tagContent.size(); i++) {
			
			Hashtag hashtag = new Hashtag();
			
			hashtag.setTagContent(tagContent.get(i));
			
			sqlSession.insert("boardMapper.hashtagInsert", hashtag);

			int generatedTagNo = hashtag.getTagNo();
			
			tagList.add(hashtag);
			
			result++;
		}

		// 2. HASHTAG 테이블 삽입
		
		// boardHashtagInsert sql문 결과 저장용 변수
		int result2 = 0;
		
		if(result > 0) {
			
			for(Hashtag hashtag : tagList) {
				
				hashtag.setBoardNo(boardNo);
				
				result2 += sqlSession.insert("boardMapper.boardHashtagInsert", hashtag);
			}
			
		}

		if(result2 > 0) result2 = boardNo;
		
		return result2;
	}

}
