package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
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
			, @RequestParam(value = "imgSrc", required = false) List<String> imgSrc
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session) {
		
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardCode(3);

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
	
	// summernote 이미지 주소 변환
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpSession session) {
		
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "/resources/images/freeBoard/";
		String webPath = session.getServletContext().getRealPath(fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지널 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
		
		File targetFile = new File(webPath + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
			
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
}
