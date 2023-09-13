package com.jeonsu.deuggeun.todolist.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

@Repository
public class TodoListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 캘린더에 로그인한  회원의 todolist 가져오기(동그라미 / 세모)
	public List<Map<String, Object>> selectTodoListAll( int loginMemberNo) {
		return sqlSession.selectList("todolistMapper.selectTodoListAll", loginMemberNo);
	}

	// 선택한 날짜에 대한 todolist 상세 가져오기  
	public List<TodoList> DetailedTodoList(String choiceTodoDate) {
		return sqlSession.selectList("todolistMapper.DetailedTodoList", choiceTodoDate);
	}

	//  체크박스 상태에 대한 결과 DB반영
	public int todoUpdate(TodoList updateTodo) {
		return sqlSession.update("todolistMapper.todoUpdate", updateTodo );
	}
}
