package com.jeonsu.deuggeun.todolist.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Health {

	private int healtLevel;
	private String healthName;
	private String healthParent;
}
