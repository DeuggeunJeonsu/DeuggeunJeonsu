package com.jeonsu.deuggeun.board.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Routine;

public interface ljyBoardService {

	// 공유게시판 목록
	Map<String, Object> selectShareBoardList(int boardCode, int cp);

	// 게시글 상세
	Board selectShareBoard(Map<String, Object> map);

	// 좋아요 여부 확인 
	int shareBoardLikeCheck(Map<String, Object> map);

	// 조회수 증가
	int updateShareBoardReadCount(int boardNo);

	// 좋아요 처리
	int shareBoardLike(Map<String, Integer> paramMap);

	// 멤버 팔로우
	int memberUnfollow(Map<String, Integer> paramMap);

	//멤버 언팔로우 
	int memberFollow(Map<String, Integer> paramMap);

	// 팔로우 여부 확인 
	int memberFollowCheck(Map<String, Object> map);

	//---------------------------------------------
	/*board2*/
	
	// 게시글 삽입 
	int boardInsert(Board board, List<MultipartFile> images, String webPath, String filePath, List<Routine> routines)
			throws IllegalStateException, IOException;

	


	
	
}