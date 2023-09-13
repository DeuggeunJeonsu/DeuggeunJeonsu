package com.jeonsu.deuggeun.todolist.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.todolist.model.dao.TodoListDao;

@Service
public class TodoListServiceImp implements TodoListService{

	@Autowired
	private TodoListDao dao;
	
	@Override
	public List<Map<String, Object>> selectTodoListAll(int loginMemberNo) {
		return dao.selectTodoListAll(loginMemberNo);
	}
	
}
