package com.jeonsu.deuggeun.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 관리자 페이지
	@RequestMapping("/adminBoardList")
	public String adminBoardList() {

		return "board/adminBoardList";
	}

	// 회원 목록
	@RequestMapping("/userList")
	public String userList() {

		return "admin/userList";
	}

	// 회원 문의 목록
	@RequestMapping("/adminInquiry")
	public String adminInquiry() {

		return "admin/adminInquiry";
	}

	// 회원 문의 답변 작성페이지
	@RequestMapping("/adminIqWrite")
	public String adminIqWrite() {

		return "admin/adminIqWrite";
	}


}
