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

	// 자유게시판 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, List<String> tagContent, List<String> imgSrc) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
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

	// 자유게시판 게시글 목록 조회
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

	// 자유게시판 게시글 상세 조회
	@Override
	public Board selectFreeBoard(Map<String, Object> map) {
		return dao.selectFreeBoard(map);
	}

	// 좋아요 여부 확인
	@Override
	public int freeBoardLikeCheck(Map<String, Object> map) {
		return dao.freeBoardLikeCheck(map);
	}
	
	// 좋아요 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int freeBoardLike(Map<String, Integer> paramMap) {
		
		int result = 0;
		
		if(paramMap.get("check") == 0) {
			result = dao.insertFreeBoardLike(paramMap);
		
		} else {
			result = dao.deleteFreeBoardLike(paramMap);			
		}
		
		if(result == 0) return -1;
		
		int count = dao.countFreeBoardLike(paramMap.get("boardNo"));
		
		return count;
		
	}
	
	// 조회 수 증가
	@Override
	public int updateFreeBoardReadCount(int boardNo) {
		return dao.updateFreeBoardReadCount(boardNo);
	}

	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int freeBoardUpdate(Board board, int cp, List<String> insertList, List<String> imgSrc, String deleteList) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		int rowCount = dao.freeBoardUpdate(board);
		
		// 게시글 수정(제목, 내용)을 성공했을 때
		if(rowCount > 0) {

			if(!deleteList.equals("")) {
				// 삭제할 해시태그가 있다면!
				
				int result = 0;
				
				Map<String, Object> deleteMap = new HashMap<>();
				deleteMap.put("boardNo", board.getBoardNo());
				deleteMap.put("deleteList", deleteList);
				
				result = dao.hashtagDelete(deleteMap);
				
				if(result > 0) {
					rowCount += dao.hashtagDelete2(deleteMap);
				}
			}
			
			// 새로 추가할 해시태그가 있다면,,,
			if(insertList != null) {
				rowCount += dao.hashtagUpdate(board.getBoardNo(), insertList);
			}
		}
		
		return rowCount;
	}

	@Override
	public int freeBoardDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
