package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;

public interface MemberService {

	/** 로그인 서비스
	 * @param inputMember (email, pw)
	 * @return email, pw가 일치하는 회원 정보 또는 null
	 */
	Member login(Member inputMember);

	/** 회원 가입 서비스(비밀번호 암호화 필요)
	 * @param inputMember
	 * @return result(0 : 실패, 1 : 성공)
	 */
	int signUp(Member inputMember);

	/** 전화번호로 아이디 찾기
	 * @param memberTel
	 * @return selectMember
	 */
	Member selectMemberByTel(String memberTel);
	
	/** 아이디(이메일)로 회원 찾기
	 * @param memberEmail
	 * @return selectMember
	 */
	Member selectMemberByEmail(String memberEmail);
	
	/** 회원 BMI 히스토리 불러오기
	 * @param paramMap
	 * @return BmiHistorys
	 */
	List<MemberBMI> loadBMI(Map<String, Object> paramMap);
	
	/** 회원 정보에 BMI 히스토리 추가/업데이트하기
	 * @param paramMap
	 * @return result(0 : 실패, 1 : 성공)
	 */
	int addBMI(Map<String, Object> paramMap);

}
