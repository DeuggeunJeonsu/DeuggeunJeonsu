package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {

	@RequestMapping("/freeBoard")
	public String FreeBoardList() {
		return "board/freeBoardList";
	}
	
}
