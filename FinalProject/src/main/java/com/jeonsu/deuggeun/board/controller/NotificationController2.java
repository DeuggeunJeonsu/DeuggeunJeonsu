package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.jhjBoardService;
import com.jeonsu.deuggeun.member.model.dto.Member;

/* 공지사항 기능 Controller */
@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class NotificationController2 {

	@Autowired
	private jhjBoardService service;

	/* 공지사항 게시글 작성 */
	@PostMapping("/{boardCode:[4]}/insert") 
	public String ncinsert(Board board,
			RedirectAttributes ra,
			@PathVariable("boardCode") int boardCode,
			Model model,
			@SessionAttribute("loginMember") Member loginMember)
			 {
		
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardCode(boardCode);
		

		int result = service.ncInsert(board);
		
		String message = null;
		String path = "redirect:/";
		if(result > 0) {
			message = "작성 되었습니다.";
			path += "board/"+ boardCode +"/list";
			
			model.addAttribute("board",board);
			
		}else {
			message = "[error] 작성 실패";
			path += "insert";
			
		}
		ra.addFlashAttribute("message", message);
			
		
		return path; 
	}

	// 공지사항 수정
	@PostMapping("/{boardCode:[4]}/{boardNo}/update")
	public String ncUpdate(Board board,
			RedirectAttributes ra,
			@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			Model model,
			@RequestParam(value="cp", required = false, defaultValue= "1") int cp
			) {
		
		board.setMemberNo(1);
		board.setBoardCode(boardCode);
		board.setBoardNo(boardNo);
		
		int result = service.ncUpdate(board);
		
		
		
		String message = null;
		String path = "redirect:/";
		if(result > 0) {
			
			message = "게시굴 수정 성공";
			path += "board/" + boardCode + "/"+boardNo + "?cp=" + cp;
			
			ra.addFlashAttribute("message", message);
			
		}else {
			message = "수정 실패, 다시 시도해주세요.";
			
			path += "board/" + boardCode + "/list";
			
			ra.addFlashAttribute("message", message);
			
		}
		
		return path;
		
	}
	
	// 공지사항 게시글 삭제
	@GetMapping("/{boardCode:[4]}/{boardNo}/delete")
	public String ncDelete(
			@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			RedirectAttributes ra,
			@RequestParam(value="cp", required = false, defaultValue= "1") int cp
			) {
		
		Board board = new Board();
		
		board.setBoardCode(boardCode);
		board.setBoardNo(boardNo);
		
		int result = service.ncDelete(board);
		
		
		String message = null;
		String path = "";
		if(result > 0) {
			
			System.out.println("삭제 성공하면 여기");
			message = "게시글 삭제 성공";
			path = "redirect:" +   "/board/"+ boardCode +"/list";
			
			ra.addFlashAttribute("message", message);
			
		}else {
			
			System.out.println("삭제 실패하면 여기");
			message = "게시글 삭제 실패";
			path += "redirect:/" + "board/" + boardCode + "/" +boardNo + "?cp=" + cp;
			
			ra.addFlashAttribute("message", message);
		}
			
		
		System.out.println(path);
		return path;
	}
	
	
	@PostMapping(value="/{boardCode:[4]}/uploadSummernoteImageFileNC", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지널 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
		
		File targetFile = new File(fileRoot + savedFileName);
		
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
