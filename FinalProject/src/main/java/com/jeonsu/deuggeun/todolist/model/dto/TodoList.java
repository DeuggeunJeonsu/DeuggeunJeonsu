package com.jeonsu.deuggeun.todolist.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TodoList {

	private int listNo; 			//투두리스트 식별 내용
	private String listContent;		//투두리스트 상세내용
	private boolean listFl; 			//투두리스트 성공여부
	private String listDetailNo;	//투두리스트 상세번호
	private int memberNo; 			// 투두리스트 작성자 
	private String lCreateDt; 		// 투두리스트 작성일
}
