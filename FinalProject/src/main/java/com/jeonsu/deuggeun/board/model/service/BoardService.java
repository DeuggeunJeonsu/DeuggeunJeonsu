package com.jeonsu.deuggeun.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	// 게시판 코드 조회
	List<Map<String, Object>> selectBoardTypeList();

}
