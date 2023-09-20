package com.jeonsu.deuggeun.board.model.service;

import java.util.List;

import com.jeonsu.deuggeun.board.model.dto.Comment;

public interface CommentService {

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return cList
	 */
	List<Comment> select(int boardNo);

	/** 댓글 작성
	 * @param comment
	 * @return result
	 */
	int insert(Comment comment);
	
	/** 댓글 삭제
	 * @param commentNo
	 * @return result
	 */
	int delete(int commentNo);

	/** 댓글 수정
	 * @param comment
	 * @return result
	 */
	int update(Comment comment);

}
