package com.jeonsu.deuggeun.board.model.service;

import java.util.List;

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

}