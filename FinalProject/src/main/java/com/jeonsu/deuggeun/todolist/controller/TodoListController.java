package com.jeonsu.deuggeun.todolist.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.todolist.model.service.TodoListService;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.todolist.model.dto.Health;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;


@Controller
@ResponseBody
@SessionAttributes({"loginMember"})
public class TodoListController {

	@Autowired
	private TodoListService service;


	@PostMapping(value = "/todolist", produces = "application/json; charset=UTF-8")
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") String loginMemberNum) {

		int loginMemberNo = Integer.parseInt(loginMemberNum);

		List<Map<String, Object>> todoList = service.selectTodoListAll(loginMemberNo);


		return todoList;
	}


	// 상세 투두리스트 가져오기 
	@PostMapping(value = "/todoDetaile", produces = "application/json; charset=UTF-8")
	public List<TodoList> todoListDetail  ( @RequestParam("choiceTodoDate") String choiceTodoDate 
			 ,@SessionAttribute("loginMember") Member loginMember
			){

		int loginMemberNo =loginMember.getMemberNo();
		
		List<TodoList> detailedTodoList = service.DetailedTodoList(choiceTodoDate,loginMemberNo);
		return detailedTodoList;
	}

	//  체크박스 상태에 대한 결과 DB반영
	@PostMapping("/todo/update" )
	public int todoUpdate (@RequestBody TodoList updateTodo) {
		return service.todoUpdate(updateTodo);
	}
	
	// 체크리스트 삭제
	@PostMapping("todo/delete")
	public int todoDelete (@RequestBody TodoList todo
					,@SessionAttribute("loginMember") Member loginMember) {
		
//		System.out.println(todo);
		int loginMemberNo =loginMember.getMemberNo();
		todo.setMemberNo(loginMemberNo);
		return service.todoDelete(todo);
	}
	
	// 체크리스트 추가
	@PostMapping("/todo/insert")
	public int todoInsert(@RequestBody TodoList insertTodo) {
		return service.todoInsert(insertTodo);
	}
	
	// 투두리스트 다 완성시 
	@GetMapping("/todo/allCompleted")
	public int allCompleted(@RequestParam("date") String date
			,@SessionAttribute("loginMember") Member loginMember) {
		
		int loginMemberNo =loginMember.getMemberNo();
		
		return service.allCompleted(date, loginMemberNo);
	}
	
	// 투두리스트 비완성
	@GetMapping("/todo/unfinished")
	public int unfinished(@RequestParam("date") String date
			,@SessionAttribute("loginMember") Member loginMember) {
		
		int loginMemberNo =loginMember.getMemberNo();
		
		return service.unfinished(date, loginMemberNo);
	}
	
	@GetMapping(value="/todo/auto/selecthealth", produces = "application/json; charset=UTF-8")
	public List<Health> autoSearch(String query){
		
		Map<String, Object>map = new HashMap<>();
		
		map.put("query", query);
		return service.autoSearch(map);
		
		
	}

}
