package com.jeonsu.deuggeun.member.model.service;

import java.util.Map;

public interface MyPageService {

	/** 마이페이지 내 게시글 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyBoardList(int memberNo, int cp);

}
