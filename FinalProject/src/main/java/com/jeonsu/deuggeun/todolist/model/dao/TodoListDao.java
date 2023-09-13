package com.jeonsu.deuggeun.todolist.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TodoListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, Object>> selectTodoListAll( int loginMemberNo) {
		return sqlSession.selectList("todolistMapper.selectTodoListAll", loginMemberNo);
	}
}