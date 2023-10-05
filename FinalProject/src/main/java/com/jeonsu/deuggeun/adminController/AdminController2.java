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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.adminController.model.service.AdminService;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginMember"})
public class AdminController2 {

	@Autowired
	private AdminService service;

	// 회원 탈퇴
	@PostMapping("/userDel")
	public String userDel(AdminMember member,
			RedirectAttributes ra
			
			) {
	
		int result = service.userDel(member); 
	
		String path = "redirect:";
		
		if(result > 0 ) {
			path += "/admin/userList";
			ra.addFlashAttribute("message", "회원탈퇴 성공");
			
		}else {
			
			path += "/admin/userList";
			ra.addFlashAttribute("message", "회원탈퇴 실패");
		}

		return path;
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

	// 관리자 1:1 문의 답변
	@PostMapping(value="/QnAWrite", produces = "application/json; charset=UTF-8")
	public String QnAWrite(AdminMember board,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("boardNo") int userBoardNo,
			RedirectAttributes ra
			) {

		board.setMemberNo(loginMember.getMemberNo());
		int result = service.insertQnA(board ,userBoardNo);

		String path = "redirect:";
		if(result > 0) {

			path += "/admin/adminInquiry";

			ra.addFlashAttribute("message", "1:1 문의 답변 성공");

		}else {
			path += "/admin/adminInquiry";

			ra.addFlashAttribute("message", "작성 실패");
		}
		return path;
	}

	// 관리자 상품 문의 답변
	@PostMapping(value="/marketInWrite", produces = "application/json; charset=UTF-8")
	public String marketInWrite(AdminMember board,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("marketTitle") String marketTitle,
			RedirectAttributes ra
			) {

		board.setMemberNo(loginMember.getMemberNo());
		
		int result = service.marketInWrite(board ,marketTitle);

		String path = "redirect:";
		if(result > 0) {

			path += "/admin/adminInquiry";

			ra.addFlashAttribute("message", "상품 문의 답변 성공");

		}else {
			path += "/admin/adminInquiry";

			ra.addFlashAttribute("message", "작성 실패");
		}
		return path;
	}

}
