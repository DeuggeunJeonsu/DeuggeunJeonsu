package com.jeonsu.deuggeun.adminController.model.service;

import java.util.Map;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dto.Member;

/**
 * @author jk031
 *
 */
public interface AdminService {

	/** 멤버 목록 조회
	 * @return memberList
	 */
	Map<String, Object> selectMember();

	/** 회원 탈퇴
	 * @param member
	 * @return result
	 */
	int userDel(AdminMember member);

	/** 회원 문의 목록 조회
	 * @return boardList
	 */
	Map<String, Object> selectInquiryList();

	/** 1: 문의 리스트 조회
	 * @return
	 */
	Map<String, Object> selectInquiry1();
	
	/** 특정 문의 리스트 조회
	 * @return boardList
	 */
	Map<String, Object> selectInquiry2();

	/** 관리자 1:1 문의 답변
	 * @param board
	 * @param boardNo2 
	 * @return result
	 */
	int insertQnA(AdminMember board , int userBoardNo);

	/** 관리자 상품 문의 답변
	 * @param board
	 * @param boardNo
	 * @return result
	 */
	int marketInWrite(AdminMember board, int boardNo);

	/** 회원 문의 상세정보 조회
	 * @param boardNo
	 * @return Board
	 */
	AdminMember adminInquiryDetail(int boardNo);


}
