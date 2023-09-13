package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.jhjBoardService;

/* 공지사항 화면 Controller */
@Controller
@RequestMapping("/board/4")
public class NotificationController {

	

	@RequestMapping("/test")
	public String boardList() {
		return "board/boardList";
	}

	@GetMapping("/list")
	public String notificationList() {

		return "board/notification/notificationList";
	}

	@GetMapping("/list/notificationWrite")
	public String notificationWrite() {

		return "board/notification/notificationWrite";
	}

	@GetMapping("/list/notificationDetail")
	public String notificationDetail() {

		return "board/notification/notificationDetail";
	}


	


	// 리뷰작성 요청
	@RequestMapping("/reviewWrite")
	public String reivewWrite() {
		return "board/reviewWrite";
	}
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
