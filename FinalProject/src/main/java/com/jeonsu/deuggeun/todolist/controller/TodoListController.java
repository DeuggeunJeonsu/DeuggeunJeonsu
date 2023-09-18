package com.jeonsu.deuggeun.todolist.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.type.filter.AbstractClassTestingTypeFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.todolist.model.service.TodoListService;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;


@Controller
@ResponseBody
//@SessionAttributes({"loginMember"})
public class TodoListController {

	@Autowired
	private TodoListService service;


	@PostMapping(value = "/todolist", produces = "application/json; charset=UTF-8")
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") String loginMemberNum) {

		int loginMemberNo = Integer.parseInt(loginMemberNum);

		List<Map<String, Object>> todoList = service.selectTodoListAll(loginMemberNo);

		//List<Map<String, Object>> completedTodoList = new ArrayList<>();
		// 중복된 "L_CREATE_DT" 값을 제거하기 위한 Set
		Set<String> uniqueDates = new HashSet<>();

		// 중복되지 않은 데이터를 저장할 새로운 List
		List<Map<String, Object>> uniqueTodoList = new ArrayList<>();

		// 각 Map을 하나씩 처리하기 위한 반복문
		for (Map<String, Object> todoItem : todoList) {
			// "L_CREATE_DT" 값을 추출
			String createDate = (String) todoItem.get("L_CREATE_DT");

			String listFl ="N";

			// 중복된 "L_CREATE_DT" 값을 가진 경우 해당 map을 제외하고 중복되지 않은 데이터만 추가
			if (!uniqueDates.contains(createDate) && uniqueDates.contains(listFl)) {
				// todoList가 실행 여부가 'N'인 경우 먼저 추가 
				uniqueDates.add(createDate);
				uniqueTodoList.add(todoItem);
			}else if(!uniqueDates.contains(createDate) && !uniqueDates.contains(listFl)){
				// todoList가 실행 여부가 'Y'인 경우 먼저 추가 	
				uniqueDates.add(createDate);
				uniqueTodoList.add(todoItem);
			}

		}

		return uniqueTodoList;
	}


	// 상세 투두리스트 가져오기 
	@PostMapping(value = "/todoDetaile", produces = "application/json; charset=UTF-8")
	public List<TodoList> todoListDetail  ( @RequestParam("choiceTodoDate") String choiceTodoDate ){
		List<TodoList> detailedTodoList = service.DetailedTodoList(choiceTodoDate);
//		System.out.println(detailedTodoList);
		return detailedTodoList;
	}

	//  체크박스 상태에 대한 결과 DB반영
	@PostMapping("/todo/update" )
	public int todoUpdate (@RequestBody TodoList updateTodo) {
		return service.todoUpdate(updateTodo);
	}
	
	// 체크리스트 삭제
	@PostMapping("todo/delete")
	public int todoDelete (@RequestParam("todoNo") int todoNo) {
		return service.todoDelete(todoNo);
	}
	
	// 체크리스트 추가
	@PostMapping("/todo/insert")
	public int todoInsert(@RequestBody TodoList insertTodo) {
		System.out.println(insertTodo);
		return service.todoInsert(insertTodo);
	}


}
