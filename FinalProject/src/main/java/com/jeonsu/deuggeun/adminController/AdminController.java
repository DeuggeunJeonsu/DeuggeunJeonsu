package com.jeonsu.deuggeun.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/adminBoardList")
	public String adminBoardList() {
		
		return "board/adminBoardList";
	}
	
	@RequestMapping("/userList")
	public String userList() {
		
		return "admin/userList";
	}

}
