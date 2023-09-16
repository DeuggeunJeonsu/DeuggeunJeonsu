package com.jeonsu.deuggeun.member.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberBMI {
	private int bmiNo; 		// BMI번호
	private int memberNo;	// 회원번호
	private double bmi;		// BMI 값
	private String bmiDate; // BMI 측정일
}
