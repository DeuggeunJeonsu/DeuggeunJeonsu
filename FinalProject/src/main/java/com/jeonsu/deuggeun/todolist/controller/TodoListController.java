package com.jeonsu.deuggeun.todolist.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.todolist.model.service.TodoListService;


@Controller
@ResponseBody
//@SessionAttributes({"loginMember"})
public class TodoListController {
	
	@Autowired
	private TodoListService service;
	
	
	@PostMapping(value = "/todolist")
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") int loginMemberNo) {
	    List<Map<String, Object>> todoList = service.selectTodoListAll();
	    
	    // 중복된 "L_CREATE_DT" 값을 제거하기 위한 Set
	    Set<String> uniqueDates = new HashSet<>();
	    
	    // 중복되지 않은 데이터를 저장할 새로운 List
	    List<Map<String, Object>> uniqueTodoList = new ArrayList<>();
	    
	    // 각 Map을 하나씩 처리하기 위한 반복문
	    for (Map<String, Object> todoItem : todoList) {
	        // "L_CREATE_DT" 값을 추출
	        String createDate = (String) todoItem.get("L_CREATE_DT");
	        
	        // 중복된 "L_CREATE_DT" 값을 가진 경우 해당 map을 제외하고 중복되지 않은 데이터만 추가
	        if (!uniqueDates.contains(createDate)) {
	            uniqueDates.add(createDate);
	            uniqueTodoList.add(todoItem);
	        }
	        
	        // 추출한 값으로 원하는 작업 수행
	        int listNo = (int) todoItem.get("LIST_NO");
	        System.out.println("LIST_NO: " + listNo);
	        System.out.println("L_CREATE_DT: " + createDate);
	        
	    }
	    
	    return uniqueTodoList;
	}

}
