package com.jeonsu.deuggeun.member.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Badge {

	private int badgeNo; // 뱃지 번호
	private String badgeName; // 뱃지 이름
	private String badgeContent; // 뱃지 내용
	private String badgeImage; // 뱃지 이미지 경로
	private String badgeDate; // 획득 날짜
	private char badgeFlag; // 획득 여부
}
