package com.jeonsu.deuggeun.adminController.model.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.adminController.model.dao.AdminDAO;
import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;

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


}
