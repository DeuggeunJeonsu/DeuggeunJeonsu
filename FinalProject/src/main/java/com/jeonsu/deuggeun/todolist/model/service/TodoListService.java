package com.jeonsu.deuggeun.todolist.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

public interface TodoListService  {

	// 캘린더에 출력될 todolist 목록 
	List<Map<String, Object>> selectTodoListAll(int loginMemberNo);

	// 선택된 날짜로 상세 투두리스트 불러오기 
	List<TodoList> DetailedTodoList(String choiceTodoDate, int loginMemberNo);

	// 체크박스 상태에 따라 바꾸기 
	int todoUpdate(TodoList updateTodo);

	// 체크리스트 삭제하기
	int todoDelete(int todoNo);

	// 체크리스트에 추가하기
	int todoInsert(TodoList insertTodo);

}
