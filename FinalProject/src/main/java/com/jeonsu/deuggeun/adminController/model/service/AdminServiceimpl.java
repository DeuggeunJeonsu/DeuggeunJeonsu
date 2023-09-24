package com.jeonsu.deuggeun.adminController.model.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.adminController.model.dao.AdminDAO;
import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Service
public class AdminServiceimpl implements AdminService{

	@Autowired
	private AdminDAO dao;

	// 회원 목록 조회
	@Override
	public Map<String, Object> selectMember() {

		List<AdminMember> memberList = dao.selectMember();

		Map<String, Object> map = new HashMap<>();

		map.put("memberList", memberList);


		return map;
	}

	// 회원 탈퇴
	@Override
	public int userDel(AdminMember member) {
		return dao.userDel(member);
	}

	// 회원 문의 목록 조회
	@Override
	public Map<String, Object> selectInquiryList() {
		List<AdminMember> boardList = dao.selectInquiryList();

		Map<String, Object> map = new HashMap<>();

		map.put("boardList", boardList);

		return map;
	}

	// 1:1 문의 리스트 조회
	@Override
	public Map<String, Object> selectInquiry1() {
		
		List<AdminMember> boardList = dao.selectInquiry1();

		Map<String, Object> map = new HashMap<>();

		map.put("boardList", boardList);

		return map;
	}

	// 특정 문의 리스트 조회
	@Override
	public Map<String, Object> selectInquiry2() {

		List<AdminMember> boardList = dao.selectInquiry2();

		Map<String, Object> map = new HashMap<>();

		map.put("boardList", boardList);

		return map;
	}

	// 관리자 1:1 문의 답변
	@Override
	public int insertQnA(AdminMember board, int userBoardNo ) {
		
		int result = dao.insertQnA(board);
		
		board.setAdminBoardNo(board.getBoardNo());
		
		board.setBoardNo(userBoardNo);
		
		  if(result > 0) {
			  
			  
			  System.out.println(board.getBoardNo() +"여기오냐?");
			  System.out.println(board.getAdminBoardNo() +"여기오냐?");
			  //  문의 관리자 답변 여부 변경
			  result = dao.updateQnA(board);
			  System.out.println("여기오냐?");
		  }
		 
		return result;
	}
	
	// 관리자 상품 문의 답변
	@Override
	public int marketInWrite(AdminMember board, int boardNo) {
		
		int result = dao.marketInWrite(board);
		
		board.setBoardNo(boardNo);
		
		  if(result > 0) {
			  
			  
			  // 문의 관리자 답변 여부 변경
			  result = dao.updateQnA(board);
		  }
		 
		return result;
	}

	// 문의 상세정보 조회
	@Override
	public AdminMember adminInquiryDetail(int boardNo) {
		
		AdminMember boardDetail = dao.adminInquiryDetail(boardNo);
		return null;
	}


}
