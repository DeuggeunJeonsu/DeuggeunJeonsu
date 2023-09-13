package com.jeonsu.deuggeun.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.board.model.service.BoardService;


@Controller
@RequestMapping("/board/3")
//@SessionAttributes({"loginMember"})
public class FreeBoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/list")
	public String FreeBoardList() {
		return "board/freeBoard/freeBoardList";
	}

	@GetMapping("/detail")
	public String FreeBoardDetail() {
		return "board/freeBoard/freeBoardDetail";
	}
	
	
}
