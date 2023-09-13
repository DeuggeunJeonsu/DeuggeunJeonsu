package com.jeonsu.deuggeun.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dao.BoardDAO;
import com.jeonsu.deuggeun.board.model.dao.ashBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.BoardImage;
import com.jeonsu.deuggeun.board.model.dto.Hashtag;
import com.jeonsu.deuggeun.common.utility.Util;

@Service
public class ashBoardServiceImpl implements ashBoardService{

	@Autowired
	private ashBoardDAO dao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, List<String> tagContent, String webPath, String filePath) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		
		// 게시글 삽입
		int boardNo = dao.boardInsert(board);
		
		// 해시태그 삽입
		if(boardNo > 0) {
			
			int result = dao.hashtagInsert(boardNo, tagContent);
			
		}
		
		// 이미지 삽입
//		if(boardNo > 0) {
//			
//
//			}
//			
//			
//			
//		}
		
		return boardNo;
	}

}
