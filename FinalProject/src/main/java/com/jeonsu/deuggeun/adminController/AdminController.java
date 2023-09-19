package com.jeonsu.deuggeun.adminController;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.adminController.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	// 관리자 페이지
	@RequestMapping("/adminBoardList")
	public String adminBoardList() {

		return "board/adminBoardList";
	}

	// 회원 목록
	@GetMapping("/userList")
	public String userList(Model model) {

		
		Map<String, Object> map = service.selectMember();
		
		if(map.get("memberList") != null) {
			
			
			model.addAttribute("map", map);
		}
		
		
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

	// 회원 문의 답변 작성페이지
	@RequestMapping("/marketWrite")
	public String marketWrite() {

		return "admin/marketWrite";
	}


}
