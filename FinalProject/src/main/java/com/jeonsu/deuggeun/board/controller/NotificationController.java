package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.ashBoardService;
import com.jeonsu.deuggeun.board.model.service.jhjBoardService;
import com.jeonsu.deuggeun.member.model.dto.Member;

/* 공지사항 화면 Controller */
@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class NotificationController {


	@Autowired
	private jhjBoardService service;

	@Autowired
	private ashBoardService service2;

	@RequestMapping("/test")
	public String boardList() {
		return "board/boardList";
	}


	// 공지사항 목록
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
			@SessionAttribute(value = "loginMember", required = false) Member loginMember,
			Model model,
			RedirectAttributes ra,
			HttpServletRequest req,
			HttpServletResponse resp
			)throws ParseException {


		Map<String, Object> map = new HashMap<>();

		map.put( "boardCode",boardCode);
		map.put("boardNo",boardNo);


		Board board = service.selectNcBoardDetail(map);
		

		String path = null;



		if(board != null) {

			// 좋아요 여부 확인
			if(loginMember != null ) {

				map.put("memberNo", loginMember.getMemberNo() );

				int result = service2.freeBoardLikeCheck(map);
				
				// 좋아요 누른 적 있을 때
				if(result > 0) model.addAttribute("likeCheck", "on");
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


	// 좋아요 처리
	@PostMapping("/4/like")
	@ResponseBody
	public int freeBoardLike(@RequestBody Map<String, Integer> paramMap) {
		return service2.freeBoardLike(paramMap);
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
