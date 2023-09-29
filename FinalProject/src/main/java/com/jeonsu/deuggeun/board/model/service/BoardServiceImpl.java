package com.jeonsu.deuggeun.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.board.model.dao.BoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.common.utility.Util;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	// 게시판 코드 조회
	@Override
	public List<Map<String, Object>> selectBoardTypeList() {
		return dao.selectBoardTypeList();
	}
	
	// 게시판 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, List<String> tagContent, String[] imgSrc) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		// 게시글 삽입
		int boardNo = dao.boardInsert(board);
		
		// 게시글 해시태그 삽입
		int result = dao.hashtagInsert(boardNo, tagContent);
		log.debug("해시태그 삽입결과 {}", result);
		
		// 이미지가 있을 경우 이미지 삽입			
		if(boardNo > 0 && imgSrc != null) {
			int result2 = dao.informationBoardImageInsert(boardNo, imgSrc);
			log.debug("보드 이미지 삽입결과 {}", result2);
		}

		return boardNo;
	}

	// 게시판 게시글 목록 조회
	@Override
	public Map<String, Object> selectInformationBoardList(int boardCode, int cp) {
		
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

	// 게시판 게시글 상세 조회
	@Override
	public Board selectInformationBoard(Map<String, Object> map) {
		return dao.selectInformationBoard(map);
	}

	// 좋아요 여부 확인
	@Override
	public int informationBoardLikeCheck(Map<String, Object> map) {
		return dao.informationBoardLikeCheck(map);
	}
	
	// 좋아요 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int informationBoardLike(Map<String, Integer> paramMap) {
		
		int result = 0;
		
		if(paramMap.get("check") == 0) {
			result = dao.insertInformationBoardLike(paramMap);
		
		} else {
			result = dao.deleteInformationBoardLike(paramMap);			
		}
		
		if(result == 0) return -1;
		
		int count = dao.countInformationBoardLike(paramMap.get("boardNo"));
		
		return count;
		
	}
	
	// 조회 수 증가
	@Override
	public int updateInformationBoardReadCount(int boardNo) {
		return dao.updateInformationBoardReadCount(boardNo);
	}

	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int informationBoardUpdate(Board board, int cp, List<String> insertList, String[] imgSrc) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		// 게시글 내용 수정
		int result = dao.informationBoardUpdate(board);
		
		// 게시글 내용 수정에 성공했을 때
		if(result>0) {
			// 게시글 해시태그 수정
			int hashResult = dao.hashtagUpdate(board);
			log.debug("해시태그 수정결과 {}",hashResult);
			
			// 이미지가 있으면 수정, 없으면 삭제
			if(imgSrc != null) {
				// 게시글 프리뷰 이미지 삭제
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("boardNo",board.getBoardNo());
				
				int imageResult = dao.informationBoardImageDelete(map);
				log.debug("기존 보드 이미지 삭제여부 {}",imageResult);
				
				int imageResult2 = dao.informationBoardImageInsert(board.getBoardNo(), imgSrc);
				log.debug("보드 이미지 삽입결과 {}",imageResult2);
			}
		}
		
		return result;
	}

	// 게시글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int informationBoardDelete(Map<String, Object> map) {
		
		// 게시글 내용 삭제
		int result = dao.informationBoardDelete(map);
		
		// 게시글 내용 삭제에 성공했을 때
		if(result > 0) {
		
			// 게시글에 포함되어 있던 해시태그, 이미지 삭제
			int hashResult = dao.informationBoardHashtagDelete(map);
			log.debug("해시태그 삭제결과 {}",hashResult);
			
			int imageResult = dao.informationBoardImageDelete(map);
			log.debug("보드 이미지 삭제결과 {}",imageResult);
		}
		
		return result;
	}

	// 게시판 게시글 상세 검색
	@Override
	public Map<String, Object> selectInformationBoardList(Map<String, Object> paramMap, int cp) {
		
		// 검색된 게시글 수 조회
		int listCount = dao.getInformationBoardListCount(paramMap);
		
		// 페이지네이션
		Pagination pagination = new Pagination(cp, listCount);
		
		// 현재 페이지에 해당하는 게시글 목록만 조회
		List<Board> boardList = dao.selectInformationBoardList(pagination, paramMap);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}
}
