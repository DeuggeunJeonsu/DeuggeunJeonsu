package com.jeonsu.deuggeun.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.BoardService;
import com.jeonsu.deuggeun.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board2/1")
@SessionAttributes({"loginMember"})
@Slf4j
public class InformationBoardController2 {

	@Autowired
	private BoardService service;

	// 게시글 작성 화면 전환
	@GetMapping("/write")
	public String boardWrite() {
		return "board/informationBoard/informationBoardWrite";
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
		board.setBoardCode(1);
		
		int boardNo = service.boardInsert(board, tagContent, imgSrc);
		
		String message = null;
		String path = "redirect:";
		
		if(boardNo > 0) { // 게시글 등록 성공
			log.debug("정보공유 게시판 {}번 게시글 삽입 성공", boardNo);
			message = "게시글이 등록되었습니다.";
			path += "/board/" + board.getBoardCode() + "/" + boardNo;
			
		} else { // 게시글 등록 실패
			log.debug("정보공유 게시판 게시글 삽입 실패");
			message = "게시글 등록에 실패했습니다.";
			path += "write";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	// 게시글 수정 화면 전환
	@GetMapping("/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardNo") int boardNo
			, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardCode", 1);
		map.put("boardNo", boardNo);
		
		Board board = service.selectInformationBoard(map);
		
		model.addAttribute("board", board);
		
		return "board/informationBoard/informationBoardUpdate";
	}

	// 게시글 수정
	@PostMapping("/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardNo") int boardNo
			, Board board
			, @RequestParam(value = "insertList", required = false) List<String> insertList
			, @RequestParam(value = "imgSrc", required = false) String[] imgSrc
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, HttpSession session
			, RedirectAttributes ra
			) {
		
		board.setBoardCode(1);
		board.setBoardNo(boardNo);
		
		int rowCount = service.informationBoardUpdate(board, cp, insertList, imgSrc);
		
		String message = null;
		String path = "redirect:";
		
		if(rowCount > 0) {
			log.debug("정보공유 게시판 {}번 게시글 수정 성공", boardNo);
			message = "게시글이 수정되었습니다.";
			path += "/board/1/" + boardNo + "?cp=" + cp;
			
		} else {
			log.debug("정보공유 게시판 {}번 게시글 수정 실패", boardNo);
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
		map.put("boardCode", 1);
		map.put("boardNo", boardNo);
		
		int result = service.informationBoardDelete(map);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			log.debug("정보공유 게시판 {}번 게시글 삭제 성공", boardNo);
			path += "/board/1/list";
		
		} else {
			log.debug("정보공유 게시판 {}번 게시글 삭제 실패", boardNo);
			message = "게시글 삭제에 실패했습니다.";
			path += "/board/1/" + boardNo;
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
