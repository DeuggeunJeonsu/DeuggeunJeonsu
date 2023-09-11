package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImage {
	
	private int imageNo; // 이미지 번호
	private String imagePath; // 이미지 경로
	private String imageOriginal; // 이미지 원본명
	private String imageReName; // 변경된 이미지 파일명
	private int boardNo; // 이미지가 첨부된 게시글 번호
	private int imageLevel; // 이미지 순서
}
