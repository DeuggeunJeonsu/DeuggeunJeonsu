package com.jeonsu.deuggeun.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.common.utility.Util;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.service.MemberService;

@Controller 

@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 전용 화면 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 로그인 요청 처리
	@PostMapping("/login")
	public String login(Member inputMember, Model model,
						@RequestHeader(value="referer") String referer,
						@RequestParam(value="saveId", required=false) String saveId,
						HttpServletResponse resp,
						RedirectAttributes ra){
		
		// 로그인 서비스 호출
		Member loginMember = service.login(inputMember);
			
		// DB 조회 결과 확인
	   	System.out.println(loginMember);
	
		String path = "redirect:";
	   
		if(loginMember != null) { // 로그인 성공 시
			
			// 세션에 로그인한 회원 정보 추가
			model.addAttribute("loginMember", loginMember);
			
			// 메인페이지로
			path += "/";
			
			// 로그인 시 아이디 저장용 쿠키 생성
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
			
			// 아이디 저장 체크 되었을 때 한달간 유지되는 쿠키생성
			if(saveId != null) cookie.setMaxAge(60 * 60 * 24 * 30);
			
			// 아이디 저장 체크 안되었을 때 쿠키삭제
			else cookie.setMaxAge(0);
				
			// 클라이언트가 어떤 요청을 할 때 쿠키가 첨부될지 경로(주소)를 지정
			cookie.setPath("/member/login");
			
			// 응답 객체(HttpServletResponse)를 이용해서
			// 만들어진 쿠키를 클라이언트에게 전달
			resp.addCookie(cookie);

		} 
		else { // 로그인 실패 시
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			path += referer; // 이전 페이지로
		}
			
		return path;
	}
	
	// 로그아웃 요청 처리
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		// 세션 관리객체를 이용해 세션을 제거해주고
		status.setComplete();
		// 메인페이지로 이동
		return "redirect:/";
	}
	
	// 아이디, 비밀번호 찾기 화면 이동
	@GetMapping("/findInfo")
	public String findInfo() {
		return "member/findInfo";
	}
	
	// 아이디찾기 sms 인증번호 전송 ajax
	@ResponseBody
	@PostMapping(value="/sendSms", produces = "application/json; charset=UTF-8")
	public String findId(@RequestBody String memberTel, HttpServletResponse resp) {
		
		// 입력된 번호로 회원 검색
		Member selectMember = service.selectMemberByTel(memberTel);
		String AuthenticationKey="";

		// 일치하는 회원이 있으면 sms인증번호 전송
		if(selectMember !=null) AuthenticationKey = Util.sendMessage(memberTel);
		
		// 인증번호 반환
		return AuthenticationKey;
	}
	
	// 아이디찾기 sms 인증번호 확인 ajax
	@ResponseBody
	@PostMapping(value="/smsAuthentication", produces = "application/json; charset=UTF-8")
	public Member findId(@RequestBody Map<String, Object> paramMap, HttpServletRequest req, HttpServletResponse resp) {

		// 입력된 번호로 회원 검색
		return service.selectMemberByTel(String.valueOf(paramMap.get("memberTel")));
	}
	
	// 비밀번호찾기 email 인증번호 전송 ajax
	@ResponseBody
	@PostMapping(value="/sendEmail", produces = "application/json; charset=UTF-8")
	public String findPw(@RequestBody String memberEmail, HttpServletResponse resp) {
		
		// 입력된 이메일로 회원 검색
		Member selectMember = service.selectMemberByEmail(memberEmail);
		String AuthenticationKey="";

		// 일치하는 회원이 있으면 email인증번호 전송
		if(selectMember !=null) AuthenticationKey = Util.sendEmail(memberEmail);
		
		// 인증번호 반환
		return AuthenticationKey;
	}
	
	// 비밀번호찾기 email 인증번호 확인 ajax
	@ResponseBody
	@PostMapping(value="/emailAuthentication", produces = "application/json; charset=UTF-8")
	public Member findPw(@RequestBody Map<String, Object> paramMap, HttpServletRequest req, HttpServletResponse resp) {

		// 입력된 이메일로 회원 검색
		return service.selectMemberByEmail(String.valueOf(paramMap.get("memberEmail")));
	}
	
	// 비밀번호찾기 후 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(int findPwMemberNo, String changePw, RedirectAttributes ra, 
							@RequestHeader(value="referer") String referer, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", findPwMemberNo);
		map.put("newMemberPw", changePw);
		
		// 비밀번호 변경 서비스 호출
		int result = service.changePw(map);
		
		// 변경완료 -> 로그인페이지, 변경실패 -> 내정보찾기 페이지
		ra.addFlashAttribute("message", "비밀번호 재설정"+ (result>0 ? "이 완료되었습니다, 로그인 후 이용해보세요." : " 오류, 다시 시도해주세요"));
		return "redirect:"+ (result>0 ? "login" : referer);
	}
	
	// 회원 가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// 회원 가입 진행
	@PostMapping("/signUp")
	public String signUp(Member inputMember, String memberAddress, RedirectAttributes ra){
		
		// 회원가입 시 입력한 정보로 DB에 INSERT 
		int result = service.signUp(inputMember);
		
		// INSERT 성공/실패 시 메세지 설정
		String message = result> 0 ? (inputMember.getMemberNickname() + "님의 가입을 환영합니다.") : "회원 가입에 실패했습니다.";
		
		// INSERT 성공시 메인페이지로, 실패시 다시 회원가입 페이지로
		String path = "redirect:"+(result> 0 ? "/" : "signUp");
		
		//세션에 메세지 세팅
		ra.addFlashAttribute("message", message);
		
		return path;
	}

}
