package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Routine {
	
	private int rtNo;
	private String rtTitle;
	private String rtContent;
	private int boardNo;
	private int rtLevel;

}
