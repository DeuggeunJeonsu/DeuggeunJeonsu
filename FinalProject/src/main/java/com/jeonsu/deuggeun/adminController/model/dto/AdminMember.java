package com.jeonsu.deuggeun.adminController.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminMember {

	private int memberNo; // 회원 번호
	private String memberEmail; // 회원 이메일
	private String memberPw; // 회원 비밀번호
	private String memberNickname; // 회원 닉네임
	private String memberTel; // 회원 전화번호
	private String memberAddress; // 회원 주소
	private String profileImage; // 프로필 이미지 경로
	private String enrollDate; // 회원 가입일
	private String memberDeleteFlag; // 탈퇴 여부(N: 탈퇴X, Y: 탈퇴O)
	private int authority; // 회원 권한(1:일반, 2:관리자)
	
	
	private char adminCheckFl;
	private int inquiryType;
	private String boardTitle;
	private String boardContent;
	private int boardNo;
	private int adminBoardNo;
	
	private int productNo;
	private String inquiryTitle;
	private String inquiryContent;
	private char marketCheckFl;
	
}
