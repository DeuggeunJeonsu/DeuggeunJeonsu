package com.jeonsu.deuggeun.adminController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.adminController.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController2 {

	@Autowired
	private AdminService service;

	// 회원 탈퇴
	@PostMapping("/userDel")
	@ResponseBody
	public int userDel(@RequestBody AdminMember member) {


		int result = service.userDel(member); 

		return result;
	}

	// 1:1문의 리스트 조회
	@GetMapping("/selectInquiry1")
	@ResponseBody
	public Map<String, Object> selectInquiry1() {

		return service.selectInquiry1();
	}

	// 상품문의 리스트 조회
	@GetMapping("/selectInquiry2")
	@ResponseBody
	public Map<String, Object> selectInquiry2() {

		return service.selectInquiry2();
	}

	// 1:1 문의글 답변 화면
	@GetMapping("/QnAWrite")
	public String QnAWrite() {


		return "admin/adminQnAWrite";
	}
	
	// 상품 문의글 답변 화면
	@GetMapping("/marketWrite")
	public String marketWrite() {


		return "admin/adminMarketWrite";
	}

}
