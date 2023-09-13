package com.jeonsu.deuggeun.todolist.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
	@PostMapping(value = "/todolist", produces = "application/json; charset=UTF-8")
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") String loginMemberNum) {
	  
		int loginMemberNo = Integer.parseInt(loginMemberNum);
	    
	    List<Map<String, Object>> todoList = service.selectTodoListAll(loginMemberNo);
	    
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

}
