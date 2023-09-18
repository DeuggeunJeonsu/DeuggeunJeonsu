package com.jeonsu.deuggeun.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.board.model.dao.ljyBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;

@Service
public class ljyBoardServiceImpl implements ljyBoardService{

	
	@Autowired
	private ljyBoardDAO dao;
	
	
	/** 게시글 목록 조회
	 *@param boardCode
	 *@param cp
	 *@return map
	 */
	@Override
	public Map<String, Object> selectShareBoardList(int boardCode, int cp) {
		
		//게시글 수 조회
		int listCount = dao.getListCont(boardCode);
		
		// 페이지네이션 
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}
	
	
	/** 공유게시판 게시글 목록 조회 
	 *
	 */
	@Override
	public Board selectShareBoard(Map<String, Object> map) {
			return dao.selectShareBoard(map);
	}
	
	// 좋아요 여부확인
	@Override
	public int shareBoardLikeCheck(Map<String, Object> map) {
		return dao.freeBoardLikeCheck(map);
	}
	
	// 좋아요 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int shareBoardLike(Map<String, Integer> paramMap) {
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
	
	
	@Override
	public int memberFollow(Map<String, Integer> paramMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int memberUnfollow(Map<String, Integer> paramMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int memberFollowCheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateShareBoardReadCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
