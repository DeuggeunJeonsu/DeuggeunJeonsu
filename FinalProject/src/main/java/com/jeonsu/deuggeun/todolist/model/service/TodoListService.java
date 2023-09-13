package com.jeonsu.deuggeun.todolist.model.service;

import java.util.List;
import java.util.Map;

public interface TodoListService  {

	//켈린더에 출력될 todolist 목록 
	List<Map<String, Object>> selectTodoListAll(int loginMemberNo);

}
