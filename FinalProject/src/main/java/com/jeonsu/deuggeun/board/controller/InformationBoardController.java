package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/informationBoard")
public class InformationBoardController {
	
	@GetMapping("/informationBoardList")
	public String informationBoard() {
		return "/board/informationBoard/informationBoardList";
	}

}
