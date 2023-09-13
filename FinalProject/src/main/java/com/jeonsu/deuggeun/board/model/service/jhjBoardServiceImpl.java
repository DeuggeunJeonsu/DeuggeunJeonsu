package com.jeonsu.deuggeun.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.board.model.dao.jhjBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.common.utility.Util;

@Service
public class jhjBoardServiceImpl implements jhjBoardService{
	
	@Autowired
	private jhjBoardDAO dao;

	// 공지사항 게시글 삽입
	@Override
	public int ncInsert(Board board) {
		
		// XSS 방지 처리(제목만)
		board.setBoardTitle( Util.XSSHandling( board.getBoardTitle() ) ); 
		
		return dao.ncInsert(board);
	}

}
