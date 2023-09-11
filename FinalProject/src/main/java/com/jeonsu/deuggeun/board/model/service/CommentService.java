package com.jeonsu.deuggeun.board.model.service;

import java.util.List;

import com.jeonsu.deuggeun.board.model.dto.Comment;

public interface CommentService {

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return cList
	 */
	List<Comment> select(int boardNo);

}
