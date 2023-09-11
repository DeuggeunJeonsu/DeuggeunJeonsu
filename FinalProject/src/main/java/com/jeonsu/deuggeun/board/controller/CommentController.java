package com.jeonsu.deuggeun.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jeonsu.deuggeun.board.model.dto.Comment;
import com.jeonsu.deuggeun.board.model.service.CommentService;

@RestController
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	// 댓글 목록 조회
	@GetMapping(value="/comment", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Comment> select( @RequestParam("boardNo") int boardNo ) {
		return service.select(boardNo); // httpMessageconverter List -> JSON 변환
	}

}
