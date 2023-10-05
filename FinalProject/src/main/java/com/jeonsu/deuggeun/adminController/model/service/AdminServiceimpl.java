package com.jeonsu.deuggeun.adminController.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.adminController.model.dao.AdminDAO;
import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.common.utility.Util;
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

		List<AdminMember> marketList = new ArrayList<AdminMember>();

		if(boardList != null) {

			marketList = dao.selectInquiryList2();
		}
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("boardList", boardList);
		map.put("marketList", marketList);

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
		
		board.setBoardTitle( Util.XSSHandling( board.getBoardTitle() ) ); 
		board.setBoardContent( Util.XSSHandling( board.getBoardContent() ) ); 
		
		int result = dao.insertQnA(board);
		
		board.setAdminBoardNo(board.getBoardNo());
		
		board.setBoardNo(userBoardNo);
		
		  if(result > 0) {
			  
			  
			  //  문의 관리자 답변 여부 변경
			  result = dao.updateQnA(board);
		  }
		 
		return result;
	}
	
	// 관리자 상품 문의 답변
	@Override
	public int marketInWrite(AdminMember board, String marketTitle) {
		
		board.setBoardTitle( Util.XSSHandling( board.getBoardTitle() ) ); 
		board.setBoardContent( Util.XSSHandling( board.getBoardContent() ) ); 
		int result = dao.marketInWrite(board);
		
		
		  if(result > 0) {
			  board.setBoardTitle(marketTitle);
			  
			  
			  // 문의 관리자 답변 여부 변경
			  result = dao.updateMarket(board);
		  }
		 
		return result;
	}

	// 1:1 문의 상세조회
	@Override
	public AdminMember adminInquiryDetail(int boardNo) {
		
		AdminMember boardDetail = dao.adminInquiryDetail(boardNo);
		
		return boardDetail;
	}

	// 상품 문의 상세조회
	@Override
	public AdminMember marketDetail(int inquiryNo) {
		
		AdminMember boardDetail = dao.marketDetail(inquiryNo);
		return boardDetail;
	}


}
