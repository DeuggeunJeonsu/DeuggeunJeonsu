package com.jeonsu.deuggeun.board.model.service;

import com.jeonsu.deuggeun.board.model.dto.Board;

public interface jhjBoardService {

	/** 공지사항 게시글 삽입
	 * @param board
	 * @return result
	 */
	int ncInsert(Board board);

}
