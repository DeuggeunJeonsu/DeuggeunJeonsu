package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.member.model.dao.MemberDAO;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	// 로그인 서비스
	@Override
	public Member login(Member inputMember) {
		
		log.debug("암호화 확인 : " + bcrypt.encode(inputMember.getMemberPw()));
		
		Member loginMember = dao.login(inputMember);
		
		if(loginMember != null) { // 아이디가 일치하고
			// 입력한 pw와 DB의 암호화된 pw가 같으면
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
				// 로그인 정보에서 비밀번호 제외시켜준 후 로그인
				loginMember.setMemberPw(null);
			}
			// 비밀번호 불일치 시 로그인 실패
			else loginMember = null;
		}
		return loginMember;
	}
	
	// 전화번호로 아이디 찾기
	@Override
	public Member selectMemberByTel(String memberTel) {
		return dao.selectMemberByTel(memberTel);
	}
	
	// 아이디(이메일)로 회원 찾기
	@Override
	public Member selectMemberByEmail(String memberEmail) {
		return dao.selectMemberByEmail(memberEmail);
	}
	
	// email인증 후 비밀번호 변경
	@Override
	public int changePw(Map<String, Object> paramMap) {
		return dao.changePw(paramMap);
	}
	
	// 회원 가입 서비스
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(Member inputMember) {
		
		// 입력된 비밀번호 암호화 후 다시 세팅
		inputMember.setMemberPw(bcrypt.encode(inputMember.getMemberPw()));
		
		// 회원가입 
		return dao.signUp(inputMember);
		
	}

	// 회원 BMI 히스토리 불러오기
	@Override
	public List<MemberBMI> loadBMI(Map<String, Object> paramMap) {
		return dao.loadBMI(paramMap);
	}
	
	// 회원 정보에 BMI 히스토리 추가/업데이트하기
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int addBMI(Map<String, Object> paramMap) {
		return dao.addBMI(paramMap);
	}

	// 장바구니 상품 카운트
	@Override
	public int shoppingCount(int memberNo) {

		return dao.shoppingCount(memberNo);
	}
	
	// 회원가입 이메일 인증
	@Override
	public Member selectEmail(String memberEmail) {
		return dao.selectEmail(memberEmail);
	}

	// 회원가입 이메일 인증 확인
	@Override
	public int checkKey(String memberEmail) {
		return dao.checkKey(memberEmail);
	}


}

