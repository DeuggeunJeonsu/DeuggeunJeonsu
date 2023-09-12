package com.jeonsu.deuggeun.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.BoardService;
import com.jeonsu.deuggeun.board.model.service.ashBoardService;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Controller
@RequestMapping("/board2/3")
@SessionAttributes({"loginMember"})
public class FreeBoardController2 {

	@Autowired
	private BoardService service;
	
	@Autowired
	private ashBoardService service2;

	@GetMapping("/insert")
	public String boardInsert(@PathVariable("boardCode") int boardCode) {
		return "board/freeBoard/freeBoardWrite";
	}
	
	@PostMapping("/insert")
	public String boardInsert(
			Board board
			, @RequestParam(value = "images", required = false) List<MultipartFile> images
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session) {
		
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardCode(3);
		
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int boardNo = service2.boardInsert(board, images, webPath, filePath);
		
		String message = null;
		String path = "redirect:";
		
		if(boardNo > 0) { // 게시글 등록 성공
			message = "게시글이 등록되었습니다.";
			path += "/board/" + board.getBoardCode() + "/" + boardNo;
			
		} else { // 게시글 등록 실패
			message = "게시글 등록에 실패했습니다.";
			path += "insert";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
