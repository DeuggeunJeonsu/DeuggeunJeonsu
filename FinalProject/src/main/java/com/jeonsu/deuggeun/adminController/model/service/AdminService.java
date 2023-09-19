package com.jeonsu.deuggeun.adminController.model.service;

import java.util.Map;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;

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

}
