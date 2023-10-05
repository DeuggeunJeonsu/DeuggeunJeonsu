package com.jeonsu.deuggeun.todolist.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.todolist.model.dao.TodoListDao;
import com.jeonsu.deuggeun.todolist.model.dto.Health;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TodoListServiceImp implements TodoListService{

	@Autowired
	private TodoListDao dao;
	
	// 캘린더에 표시될 todolist (동그라미/세모)
	@Override
	public List<Map<String, Object>> selectTodoListAll(int loginMemberNo) {
		log.info(String.valueOf(loginMemberNo));
		return dao.selectTodoListAll(loginMemberNo);
	}
	
	// 선택한 날짜에 대한 상세 todolist가져오기
	@Override
	public List<TodoList> DetailedTodoList(String choiceTodoDate, int loginMemberNo ) {
		return dao.DetailedTodoList(choiceTodoDate, loginMemberNo);
	}
	
	// 체크박스 상태에 대한 결과 DB반영
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int todoUpdate(TodoList updateTodo) {
		return dao.todoUpdate(updateTodo);
	}
	
	// 투두 리스트 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int todoDelete(TodoList todo) {
		return dao.todoDelete(todo);
	}
	
	// 투두 리스트 추가
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int todoInsert(TodoList insertTodo) {
		return dao.todoInsert(insertTodo);
	}
	
	//다 완성 시 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int allCompleted(String date, int loginMemberNo ) {
		return dao.allCompleted(date, loginMemberNo);
	}
	
	// 완성했다가 취소
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int unfinished(String date, int loginMemberNo ) {
		return dao.unfinished(date, loginMemberNo);
	}
	
	@Override
	public List<Health> autoSearch(Map<String, Object> map) {
		return dao.autoSearch(map);
	}
	
	
}
