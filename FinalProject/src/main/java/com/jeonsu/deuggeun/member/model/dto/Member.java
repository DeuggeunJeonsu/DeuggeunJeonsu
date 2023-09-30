package com.jeonsu.deuggeun.member.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {
	
	private int memberNo; // 회원 번호
	private String memberEmail; // 회원 이메일
	private String memberPw; // 회원 비밀번호
	private String memberNickname; // 회원 닉네임
	private String memberTel; // 회원 전화번호
	private String memberAddress; // 회원 주소
	private String profileImage; // 프로필 이미지 경로
	private String enrollDate; // 회원 가입일
	private String memberThema; // 회원 커스터마이징 테마
	private String memberDeleteFlag; // 탈퇴 여부(N: 탈퇴X, Y: 탈퇴O)
	private int authority; // 회원 권한(1:일반, 2:관리자)
	private int attendenceDate; // 월간 출석일
	private int todoAllFlagCount; // 투두리스트 실천 횟수
	private int communityScore; // 커뮤니티 활동 점수
	
	private List<Badge> badgeList; // 뱃지 리스트
	
}
