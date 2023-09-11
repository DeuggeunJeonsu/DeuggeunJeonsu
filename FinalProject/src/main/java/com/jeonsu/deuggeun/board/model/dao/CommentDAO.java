package com.jeonsu.deuggeun.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Comment;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;


	/** 댓글 목록 조회
	 * @param boardNo
	 * @return cList
	 */
	public List<Comment> select(int boardNo) {
		return sqlsession.selectList("boardMapper.selectCommentList", boardNo);
	}


	


}
