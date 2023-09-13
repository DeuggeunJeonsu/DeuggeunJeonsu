package com.jeonsu.deuggeun.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dto.Board;

public interface ashBoardService {

	
	/** 게시글 등록
	 * @param board
	 * @param images
	 * @param tagContents
	 * @param webPath
	 * @param filePath
	 * @return boardNo
	 */
	int boardInsert(Board board, List<String> tagContent, String webPath, String filePath);

	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectFreeBoardList(int boardCode, int cp);

}
