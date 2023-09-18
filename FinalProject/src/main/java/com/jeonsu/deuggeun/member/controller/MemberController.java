package com.jeonsu.deuggeun.member.controller;

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
	
	// 아이디 찾기 sms 인증번호 전송 ajax
	@ResponseBody
	@PostMapping(value="/sendSms", produces = "application/json; charset=UTF-8")
	public int findId(@RequestBody String memberTel, HttpServletResponse resp) {
		
		String AuthenticationKey="";
		
		// 입력된 번호로 회원 검색
		Member selectMember = service.selectMemberByTel(memberTel);
		
		if(selectMember !=null) { // 일치하는 회원이 있으면 인증번호 발송, 쿠키에 인증키 저장
			AuthenticationKey = "123456";//Util.sendMessage(String.valueOf(paramMap.get("memberPhone")));
			
			// sms 전송 시 인증번호 저장용 쿠키 생성
			Cookie cookie = new Cookie(memberTel+"AtKey", AuthenticationKey);
			cookie.setMaxAge(60 * 5); // 5분간 유지
			cookie.setPath("/member/findInfo");
			resp.addCookie(cookie);
			return 1;
		}
		return 0;
	}
	
	// 아이디 찾기 sms 인증확인 ajax
	@ResponseBody
	@PostMapping(value="/smsAuthentication", produces = "application/json; charset=UTF-8")
	public Member findId(@RequestBody Map<String, Object> paramMap, HttpServletRequest req, HttpServletResponse resp) {
		
		String cookiesIdAtKey="";
		String memberTel = String.valueOf(paramMap.get("memberTel"));
		System.out.println("memberTel : "+memberTel);
		// 입력된 번호로 회원 검색
		Member selectMember = service.selectMemberByTel(memberTel);
		
		System.out.println("selectMember : "+selectMember);
		if(selectMember !=null) { // 일치하는 회원이 있으면 인증번호 일치여부 판별
			System.out.println("일치하는 회원 있음");
			Cookie[] cookies=req.getCookies(); // 모든 쿠키를 가져온 다음
		    if(cookies!=null){
		        for (Cookie c : cookies) { // 쿠키를 하나씩 꺼내서
		        	System.out.println(c);
		            String name = c.getName(); // 쿠키 이름 임시저장
		            String value = c.getValue(); // 쿠키 값 임시저장  
		            System.out.println("쿠키이름 "+name);
		            System.out.println("쿠키 값 "+ value);
		            if (name.equals(memberTel+"AtKey")) { // 내가 찾는 쿠키의 이름과 같으면
		            	cookiesIdAtKey = value; //  해당 쿠키의 값을 가져와서 cookiesIdAtKey 변수에 넣어줌
		            }
		        }
		    }
		    System.out.println("여긴 실행 되나");
		    if(cookiesIdAtKey.equals("")) return null;  // 값이 없다 == 인증번호 전송X == 인증시간 만료
		    else { // 쿠키 값이 있으면 판별
		    	System.out.println("쿠키있음");
		    	if(paramMap.get("idAtKey").equals(memberTel+"AtKey")) { // 인증번호가 일치하면 
		    		System.out.println("인증번호일치");
		    		// sms인증번호 쿠키 삭제
		    		Cookie cookie = new Cookie(memberTel, "");
		    		cookie.setMaxAge(0);
		    		cookie.setPath("/member/findInfo");
		    		resp.addCookie(cookie);
		    		// 회원 정보 반환
		    		return selectMember;
		    	}
		    }
		}
		return null;
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
		String path = "redirect:"+(result>0 ? "/" : "signUp");
		
		//세션에 메세지 세팅
		ra.addFlashAttribute("message", message);
		
		return path;
	}

}
