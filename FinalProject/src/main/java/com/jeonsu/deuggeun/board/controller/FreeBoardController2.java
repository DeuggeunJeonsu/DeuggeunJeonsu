package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Hashtag;
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

	// 게시글 작성 화면 전환
	@GetMapping("/insert")
	public String boardInsert() {
		return "board/freeBoard/freeBoardWrite";
	}
	
	// 게시글 삽입
	@PostMapping("/insert")
	public String boardInsert(
			Board board
			, @RequestParam(value = "tagContent", required = false) List<String> tagContent
			, @RequestParam(value = "imgSrc", required = false) String[] imgSrc
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session) {
		
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardCode(3);

		System.out.println(imgSrc);
		
		int boardNo = service2.boardInsert(board, tagContent, imgSrc);
		
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
	
	// 게시글 수정 화면 전환
	@GetMapping("/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardNo") int boardNo
			, Model model
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardCode", 3);
		map.put("boardNo", boardNo);
		
		Board board = service2.selectFreeBoard(map);
		
		model.addAttribute("board", board);
		
		return "board/freeBoard/freeBoardUpdate";
	}

	// 게시글 수정
	@PostMapping("/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardNo") int boardNo
			, Board board
			, @RequestParam(value = "insertList", required = false) List<String> insertList
			, @RequestParam(value = "imgSrc", required = false) String[] imgSrc
			, @RequestParam(value = "deleteList", required = false) String deleteList
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, HttpSession session
			, RedirectAttributes ra
			) {
		
		board.setBoardCode(3);
		board.setBoardNo(boardNo);
		
		int rowCount = service2.freeBoardUpdate(board, cp, insertList, imgSrc, deleteList);
		
		String message = null;
		String path = "redirect:";
		
		System.out.println(rowCount);
		
		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path += "/board/3/" + boardNo + "?cp=" + cp;
			
		} else {
			message = "게시글 수정에 실패했습니다.";
			path += "update";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	// 게시글 삭제
	@GetMapping("/{boardNo}/delete")
	public String boardDelete(
			@PathVariable("boardNo") int boardNo
			, RedirectAttributes ra
			, @RequestHeader("referer") String referer
			) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", 3);
		map.put("boardNo", boardNo);
		
		int result = service2.freeBoardDelete(map);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "/board/3/list";
		
		} else {
			message = "게시글 삭제에 실패했습니다.";
			path += "/board/3/" + boardNo;
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
