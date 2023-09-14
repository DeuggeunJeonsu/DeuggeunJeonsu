package com.jeonsu.deuggeun.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.member.model.dao.MemberDAO;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
//	@Autowired 
//	private BCryptPasswordEncoder bcrypt;
	
	// 로그인 서비스
	@Override
	public Member login(Member inputMember) {
		
//		System.out.println("암호화 확인 : " + bcrypt.encode(inputMember.getMemberPw()));
		
		Member loginMember = dao.login(inputMember);
		
		if(loginMember != null) { // 아이디가 일치하고
			// 입력한 pw와 DB의 암호화된 pw가 같으면
//			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
			if(inputMember.getMemberPw().equals(loginMember.getMemberPw())) {
				// 로그인 정보에서 비밀번호 제외시켜준 후 로그인
				loginMember.setMemberPw(null);
			}
			// 비밀번호 불일치 시 로그인 실패
			else loginMember = null;
		}
		return loginMember;
	}
	
	// 회원 가입 서비스
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(Member inputMember) {
		
		// 입력된 비밀번호 암호화 후 다시 세팅
//		inputMember.setMemberPw(bcrypt.encode(inputMember.getMemberPw()));
		
		// 회원가입 
		return dao.signUp(inputMember);
		
	}

}

