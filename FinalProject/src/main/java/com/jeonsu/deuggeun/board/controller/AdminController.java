package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/adminBoardList")
	public String adminBoardList() {
		
		return "board/adminBoardList";
	}

}
