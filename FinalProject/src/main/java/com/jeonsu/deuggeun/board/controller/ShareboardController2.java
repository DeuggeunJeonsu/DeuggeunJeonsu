package com.jeonsu.deuggeun.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Routine;
import com.jeonsu.deuggeun.board.model.service.ljyBoardService;
import com.jeonsu.deuggeun.common.utility.Util;
import com.jeonsu.deuggeun.member.model.dto.Member;



@Controller
@RequestMapping("/board2/2")
@SessionAttributes({"loginMember"})
public class ShareboardController2 {
	
	@Autowired
	private ljyBoardService service;
	
	//게시글 삽입
	@PostMapping("/insert")
	public String boardInsert(
			Board board // 커맨드 객체
			, @RequestParam(value = "images", required = false) List<MultipartFile> images
			, @RequestParam("routineName") List<String> routineNames
			, @RequestParam("routineContent") List<String> routineContents 
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session
			)  throws IllegalStateException, IOException{
		//System.out.println("routineNames :: "+routineNames);
		//System.out.println("routineContents :: "+routineContents);
		
		
		int boardCode=2;
		// 1. 로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());
		
		
		// 2. boardCode도 board에 세팅
		board.setBoardCode(boardCode);
		
		// 3. 업로드된 이미지 서버에 실제로 저장되는 경로
		// 	+	웹에서 요청청 시 이미지를 볼 수 있는 경로 
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		List<Routine> routines = new ArrayList<Routine>();
		
		for(int i = 0 ; i< routineNames.size() ; i++) {
			Routine routine = new Routine();
			
			routine.setRtTitle(Util.XSSHandling(routineNames.get(i)));
			routine.setRtContent(Util.XSSHandling(routineContents.get(i)));
			routine.setRtLevel(i);
			
			routines.add(routine);
		}

		// 게시글 삽입을 하는 서비스 호출 후 삽입된 게시글 번호 반환 받기 
		int boardNo = service.boardInsert(board, images, webPath, filePath,routines);
		
		// 게시글 삽입 성공 시 
		// -> 방금 삽입한 게시글의 상세 조회 페이지로 리다이렉트
		// -> /board/{boardCode}/{boardNo}
		
		String message = null;
		String path ="redirect:";
		
		if(boardNo > 0) { //성공 시
			message="게시글이 등록 되었습니다.";
			path +="/board/"+boardCode +"/"+boardNo;
		}else {
			message="게시글 등록 실패ㅠㅠ";
			path += "insert";
		}
		
		ra.addFlashAttribute("message", message);
		return path;
	}
	
}
