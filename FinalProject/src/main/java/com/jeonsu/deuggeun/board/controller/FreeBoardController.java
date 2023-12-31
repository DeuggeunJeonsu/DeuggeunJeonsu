package com.jeonsu.deuggeun.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.BoardService;
import com.jeonsu.deuggeun.board.model.service.ashBoardService;
import com.jeonsu.deuggeun.member.model.dto.Member;


@Controller
@RequestMapping("/board/3")
@SessionAttributes({"loginMember"})
public class FreeBoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ashBoardService service2;

	// 자유게시판 게시글 목록 조회
	@GetMapping("/list")
	public String FreeBoardList(
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap) {
		
		// 자유 게시판 코드
		int boardCode = 3;

		// 검색을 안 한 경우
		if(paramMap.get("key") == null) {
	
			Map<String, Object> map = service2.selectFreeBoardList(boardCode, cp);
			
			model.addAttribute("map", map);
		
		} 
		
		// 검색한 경우
		else {
			
			// 팔로잉 필터로 검색하기 위해
			if(loginMember != null) {
				paramMap.put("loginMemberNo", loginMember.getMemberNo());
			}
			
			paramMap.put("boardCode", 3);
			
			Map<String, Object> map = service2.selectFreeBoardList(paramMap, cp);
			
			model.addAttribute("map", map);
		}
		
		return "board/freeBoard/freeBoardList";
	}

	// 자유게시판 게시글 상세 조회
	@GetMapping("/{boardNo}")
	public String FreeBoardDetail(
			@PathVariable("boardNo") int boardNo
			, Model model
			, RedirectAttributes ra
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, HttpServletRequest req
			, HttpServletResponse resp) throws ParseException {
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", 3);
		map.put("boardNo", boardNo);
		
		Board board = service2.selectFreeBoard(map);
		
		String path = null;
		
		// 조회 결과가 있을 경우
		if(board != null) {
			
			// 로그인 상태일 때
			if(loginMember != null) {
				
				map.put("memberNo", loginMember.getMemberNo());
				map.put("boardMemberNo", board.getMemberNo());
				
				// 좋아요 여부 확인
				int result = service2.freeBoardLikeCheck(map);
				
				// 좋아요 누른 적 있을 때
				if(result > 0) model.addAttribute("likeCheck", "on");
				
				// 팔로우 여부 확인
				int result2 = service2.memberFollowCheck(map);
				
				if(result2 > 0) model.addAttribute("followCheck", "on");
			}
			
			// 쿠키로 조회 수 증가 (비회원, 글쓴이 아닌 경우에만)
			if(loginMember == null || board.getMemberNo() != loginMember.getMemberNo()) {
				
				Cookie c = null;
				
				Cookie[] cookies = req.getCookies();
				
				if(cookies != null) {
					
					for(Cookie cookie : cookies) {
						
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}
				}
				
				int result = 0;
				
				if(c == null) {
					
					c = new Cookie("readBoardNo", "|" + boardNo + "|");
					
					result = service2.updateFreeBoardReadCount(boardNo);
					
				} else {
					
					if(c.getValue().indexOf("|" + boardNo + "|") == -1) {
						c.setValue(c.getValue() + "|" + boardNo + "|");
						
						result = service2.updateFreeBoardReadCount(boardNo);
					}
					
				}
				
				if(result > 0) {
					board.setReadCount(board.getReadCount() + 1);
					
					c.setPath("/");
					
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					Date a = new Date();
					
					Date temp = new Date(cal.getTimeInMillis());

					Date b = sdf.parse(sdf.format(temp));
					
					long diff = (b.getTime() - a.getTime()) / 1000;
					
					c.setMaxAge((int)diff);
					 
					resp.addCookie(c);
				}
			}
			
			path = "board/freeBoard/freeBoardDetail";
			model.addAttribute("board", board);
			
		} else { // 조회 결과가 없을 때
			
			path = "redirect:/board/3/list";
			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
		}
		
		return path;
	}
	
	// 좋아요 처리
	@PostMapping("/like")
	@ResponseBody
	public int freeBoardLike(@RequestBody Map<String, Integer> paramMap) {
		return service2.freeBoardLike(paramMap);
	}
	
	// 멤버 팔로우
	@PostMapping("/follow")
	@ResponseBody
	public int memberFollow(@RequestBody Map<String, Integer> paramMap) {
		return service2.memberFollow(paramMap);
	}
	
	// 멤버 언팔로우
	@PostMapping("/unfollow")
	@ResponseBody
	public int memberUnfollow(@RequestBody Map<String, Integer> paramMap) {
		return service2.memberUnfollow(paramMap);
	}
	
}
