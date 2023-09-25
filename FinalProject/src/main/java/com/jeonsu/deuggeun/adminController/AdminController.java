package com.jeonsu.deuggeun.adminController;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.adminController.model.service.AdminService;
import com.jeonsu.deuggeun.board.model.dto.Board;

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
	public String adminInquiry2(Model model) {

		Map<String, Object> map = service.selectInquiryList();

		if(map.get("boardList") != null) {

			model.addAttribute("map", map);
		}
		return "admin/adminInquiry";
	}

	// 회원 문의 답변 작성페이지
	@RequestMapping("/adminQnAWrite")
	public String adminIqWrite(@RequestParam int boardNo,
			Model model) {

		model.addAttribute("boardNo" , boardNo);
		return "admin/adminQnAWrite";
	}

	// 상품문의 답변 작성페이지
	@RequestMapping("/marketWrite")
	public String marketWrite(@RequestParam int boardNo,
			Model model) {
		
		
		model.addAttribute("boardNo" , boardNo);
		return "admin/adminMarketWrite";
	}
	
	// 상품 문의 상세조회
	@RequestMapping("/adminInquiryDetail")
	@ResponseBody
	public AdminMember adminInquiryDetail(@RequestParam("boardNo") int boardNo) {
		
		
		return service.adminInquiryDetail(boardNo);
	}


}
