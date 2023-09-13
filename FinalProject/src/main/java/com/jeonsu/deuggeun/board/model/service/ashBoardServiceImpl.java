package com.jeonsu.deuggeun.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dao.BoardDAO;
import com.jeonsu.deuggeun.board.model.dao.ashBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.BoardImage;
import com.jeonsu.deuggeun.board.model.dto.Hashtag;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.common.utility.Util;

@Service
public class ashBoardServiceImpl implements ashBoardService{

	@Autowired
	private ashBoardDAO dao;

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, List<String> tagContent, List<String> imgSrc) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		
		// 게시글 삽입
		int boardNo = dao.boardInsert(board);
		
		int result = 0;
		
		// 해시태그 삽입
		if(boardNo > 0) {
			result = dao.hashtagInsert(boardNo, tagContent);
		}
		
		int result2 = 0;
		
		// 이미지 삽입
		if(result > 0) {
			result2 = dao.freeBoardImageInsert(boardNo, imgSrc);
		}

		return boardNo;
	}

	// 게시글 목록 조회
	@Override
	public Map<String, Object> selectFreeBoardList(int boardCode, int cp) {
		
		// 게시글 수 조회
		int listCount = dao.getListCount(boardCode);
		
		// 페이지네이션
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}

}
