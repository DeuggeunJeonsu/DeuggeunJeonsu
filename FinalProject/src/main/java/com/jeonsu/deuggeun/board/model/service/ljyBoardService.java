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

	

	//---------------------------------------------
	/*board2*/
	
	// 게시글 삽입 
	int boardInsert(Board board, List<MultipartFile> images, String webPath, String filePath, List<Routine> routines)
			throws IllegalStateException, IOException;

	// 사진 db목록 조회
	List<String> selectImageList();

	// 게시글 삭제 
	int shareboardDelete(Map<String, Object> map);

	// 게시글 수정
	int boardUpdate(Board board, List<MultipartFile> images, String webPath, String filePath , List<Routine> routines, String deleteList , String deleteImgList)throws IllegalStateException, IOException;

	// 게시글 검색 후 목록 리스트 
	Map<String, Object> selectFreeBoardList(Map<String, Object> paramMap, int cp);

	

	


	
	
}
