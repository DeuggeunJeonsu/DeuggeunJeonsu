package com.jeonsu.deuggeun.todolist.model.dao;

import java.util.HashMap;
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
	public List<TodoList> DetailedTodoList(String choiceTodoDate, int loginMemberNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("choiceTodoDate", choiceTodoDate);
		map.put("loginMemberNo", loginMemberNo);
		
		return sqlSession.selectList("todolistMapper.DetailedTodoList", map);
	}

	//  체크박스 상태에 대한 결과 DB반영
	public int todoUpdate(TodoList updateTodo) {
		return sqlSession.update("todolistMapper.todoUpdate", updateTodo );
	}

	//  체크박스 내용 삭제 시
	public int todoDelete(int todoNo) {
		
		return sqlSession.delete("todolistMapper.todoDelete", todoNo);
	}

	// 체크박스 내용 추가
	public int todoInsert(TodoList insertTodo) {
		int result = sqlSession.insert("todolistMapper.todoInsert", insertTodo);
		
		String createDT = sqlSession.selectOne("todolistMapper.calenderSelect", insertTodo);
		
		if(createDT=="") {
			sqlSession.insert("todolistMapper.calenderInsert", insertTodo);
		}
		if(result > 0 ) {
			result = sqlSession.insert("todolistMapper.todoDateInsert", insertTodo);
		}
		return result; 
		
	}

	// 투두 모두 완료시 
	public int allCompleted(String date) {
		return sqlSession.update("todolistMapper.allCompleted", date);
	}

	// 완성 안했을 시 
	public int unfinished(String date) {
		return sqlSession.update("todolistMapper.unfinished", date);
	}
}
