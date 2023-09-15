package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.jhjBoardService;

/* 공지사항 화면 Controller */
@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class NotificationController {


	@Autowired
	private jhjBoardService service;

	@RequestMapping("/test")
	public String boardList() {
		return "board/boardList";
	}

	@GetMapping("/{boardCode:[4]}/list")
	public String notificationList(@PathVariable("boardCode") int boardCode,
			@RequestParam Map<String, Object> boardMap,
			Model model,
			@RequestParam(value="cp", required = false, defaultValue = "1") int cp
			) {


		if(boardMap.get("searchTitle") == null) {

			// 공지사랑 목록 조회
			Map<String, Object> map = service.selectNcBoardList(boardCode, cp);

			model.addAttribute("map", map);

		}else {
			boardMap.put("boardCode", boardCode);

			// 게시글 검색
			Map<String, Object> map = service.selectNcBoardList(boardMap, cp);

			model.addAttribute("map",map);
		}



		return "board/notification/notificationList";
	}
	
	// 공지사항 작성 페이지
	@GetMapping("/{boardCode:[0-9]+}/list/notificationWrite")
	public String notificationWrite(@PathVariable("boardCode") int boardCode,
			Model model
			
			) {

		model.addAttribute("boardCode", boardCode);
		return "board/notification/notificationWrite";
	}

	// 공지사항 상세 페이지
	@GetMapping("/{boardCode}/{boardNo}")
	public String notificationDetail(@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			Model model,
			RedirectAttributes ra
			)throws ParseException {

		
		Map map = new HashMap<String, Object>();
		
		map.put( "boardCode",boardCode);
		map.put("boardNo",boardNo);
		
		
		Board board = service.selectNcBoardDetail(map);
		
		String path = null;
		
		
		
		if(board != null) {
			
			model.addAttribute("board", board);
			
			path = "board/notification/notificationDetail";
			
		}else {
			
			ra.addFlashAttribute("message", "[error] 조회 결과가 없습니다.");
			
			
			path = "redirect:/board/notification/notificationList";
			
		}
		
		return path;
	}
	
	// 공시사항 수정 페이지
	@GetMapping("/{boardCode}/{boardNo}/update")
	public String notificationUpdate(@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			Model model
			) {
		
		
		Map<String , Object> map = new HashMap<>();
		
		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);
		
		Board board = service.ncUpdateSelect(map);
		
		
		model.addAttribute("board", board);
		
		return "board/notification/notificationUpdate";
	}





	// 리뷰작성 요청
	//	@RequestMapping("/reviewWrite")
	//	public String reivewWrite() {
	//		return "board/reviewWrite";
	//	}
	// 상품문의 요청
	@RequestMapping("/inquireWrite")
	public String inquireWrite() {
		return "board/inquireWrite";
	}
	// 회원 일반 문의
	@RequestMapping("/QnAWrite")
	public String QnAWrite() {
		return "board/QnAWrite";
	}
}
