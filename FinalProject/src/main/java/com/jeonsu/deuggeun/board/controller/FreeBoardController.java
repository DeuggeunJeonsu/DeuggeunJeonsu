package com.jeonsu.deuggeun.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.board.model.service.BoardService;
import com.jeonsu.deuggeun.board.model.service.ashBoardService;


@Controller
@RequestMapping("/board/3")
//@SessionAttributes({"loginMember"})
public class FreeBoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ashBoardService service2;

	@GetMapping("/list")
	public String FreeBoardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model
			, @RequestParam Map<String, Object> paramMap) {
		
		// 자유 게시판 코드
		int boardCode = 3;
		
		if(paramMap.get("key") == null) {

			Map<String, Object> map = service2.selectFreeBoardList(boardCode, cp);
			
			model.addAttribute("map", map);
		
		}
		
		return "board/freeBoard/freeBoardList";
	}

	@GetMapping("/detail")
	public String FreeBoardDetail() {
		return "board/freeBoard/freeBoardDetail";
	}
	
	
}
