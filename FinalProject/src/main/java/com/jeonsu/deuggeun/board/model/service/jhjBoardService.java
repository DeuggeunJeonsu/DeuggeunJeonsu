package com.jeonsu.deuggeun.board.model.service;

import java.util.Map;

import com.jeonsu.deuggeun.board.model.dto.Board;

public interface jhjBoardService {

	/** 공지사항 게시글 삽입
	 * @param board
	 * @return result
	 */
	int ncInsert(Board board);

	/** 공지사항 목록 조회
	 * @param boardCode
	 * @param cp 
	 * @return boardList
	 */
	Map<String, Object> selectNcBoardList(int boardCode, int cp);

	/** 공지사항 목록 게시글 검색
	 * @param boardMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectNcBoardList(Map<String, Object> boardMap, int cp);


}
