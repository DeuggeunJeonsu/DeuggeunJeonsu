package com.jeonsu.deuggeun.board.model.service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.board.model.dao.jhjBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
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

	// 공지사항 목록 조회
	@Override
	public Map<String, Object> selectNcBoardList(int boardCode, int cp) {
		
		// 공지사항 삭제되지 않은 게시글 수 조회
		int listCount = dao.getListCount(boardCode);
		
		Pagination pagination = new Pagination(cp, listCount); 
		
		
		List<Board> boardList = dao.selectNcBoardList(pagination, boardCode);
		
		
		Map<String , Object> map = new HashMap<>();
		
		
		map.put("boardList",boardList );
		map.put("pagination", pagination);
		
		return map;
	}

	// 공지사항 목록 게시글 검색
	@Override
	public Map<String, Object> selectNcBoardList(Map<String, Object> boardMap, int cp) {
		
		int listCount = dao.getListCount(boardMap);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> boardList = dao.selectNcBoardList(pagination, boardMap);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		map.put("boardMap", boardMap);
		
		return map;
	}

	// 공지사항 게시글 상세조회
	@Override
	public Board selectNcBoardDetail(Map map) {
		return dao.selectNcBoardDetail(map);
	}

	// 공지사항 게시글 수정
	@Override
	public int ncUpdate(Board board) {
		
		// XSS 방지 처리(제목만)
		board.setBoardTitle( Util.XSSHandling( board.getBoardTitle() ) ); 
		
		return dao.ncUpdate(board);
	}

	// 공지사항 게시글 수정을 위한 게시글 조회
	@Override
	public Board ncUpdateSelect(Map<String, Object> map) {
		
		return dao.ncUpdateSelect(map);
	}

	// 공지사항 게시글 삭제
	@Override
	public int ncDelete(Board board) {
		return dao.ncDelete(board);
	}

	

}
