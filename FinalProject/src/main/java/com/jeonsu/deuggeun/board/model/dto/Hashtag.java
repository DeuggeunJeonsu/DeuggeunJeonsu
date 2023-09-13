package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Hashtag {

	private int boardNo;
	private int tagNo; // 해시태그 번호
	private String tagContent; // 해시태그 내용
	
}
