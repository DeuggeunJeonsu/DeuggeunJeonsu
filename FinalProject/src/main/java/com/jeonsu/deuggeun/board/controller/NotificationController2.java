package com.jeonsu.deuggeun.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.service.jhjBoardService;

/* 공지사항 기능 Controller */
@Controller
@RequestMapping("/board/4")
public class NotificationController2 {

	@Autowired
	private jhjBoardService service;

	/* 공지사항 게시글 작성 */
	@PostMapping("/insert") 
	public String ncinsert(Board board, RedirectAttributes ra) {
		
		board.setMemberNo(1);
		board.setBoardCode(4);

		int result = service.ncInsert(board);
		
		String message = null;
		String path = null;;
		if(result > 0) {
			message = "작성 되었습니다.";
			path = "board/notification/notificationList";
			
		}else {
			message = "[error] 작성 실패";
			path = "/insert";
			
		}
		ra.addFlashAttribute("message", message);
			
		
		return path; 
	}

	@PostMapping(value="/uploadSummernoteImageFileNC", produces = "application/json")
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
