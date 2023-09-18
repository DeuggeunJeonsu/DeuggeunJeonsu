package com.jeonsu.deuggeun.todolist.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.todolist.model.dao.TodoListDao;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

@Service
public class TodoListServiceImp implements TodoListService{

	@Autowired
	private TodoListDao dao;
	
	// 캘린더에 표시될 todolist (동그라미/세모)
	@Override
	public List<Map<String, Object>> selectTodoListAll(int loginMemberNo) {
		return dao.selectTodoListAll(loginMemberNo);
	}
	
	// 선택한 날짜에 대한 상세 todolist가져오기
	@Override
	public List<TodoList> DetailedTodoList(String choiceTodoDate) {
		return dao.DetailedTodoList(choiceTodoDate);
	}
	
	// 체크박스 상태에 대한 결과 DB반영
	@Override
	public int todoUpdate(TodoList updateTodo) {
		return dao.todoUpdate(updateTodo);
	}
	
	@Override
	public int todoDelete(int todoNo) {
		return dao.todoDelete(todoNo);
	}
	
	@Override
	public int todoInsert(TodoList insertTodo) {
		return dao.todoInsert(insertTodo);
	}
	
}
