package com.jeonsu.deuggeun.todolist.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.todolist.model.service.TodoListService;


@Controller
@ResponseBody
//@SessionAttributes({"loginMember"})
public class TodoListController {
	
	@Autowired
	private TodoListService service;
	
	
	@PostMapping(value = "/todolist" )
	public Map<String, Object> TodoList(@RequestParam("memberNo") int loginMemberNo) {
	    List<Map<String, Object>> todoList = service.selectTodoListAll();
	    
	    Map<String, Object> selectedTodo = null;

	    Set<String> daySet = null;
	    if (!todoList.isEmpty()) {
	    	
	    	daySet=new HashSet<>(datesList)
	        selectedTodo = todoList.get(0);
	    }
	    System.out.println(selectedTodo); // 연속해서 많이 찍히니 주의할 것
	    
	    
	    selectedTodo.get("L_CREATE_DT");
	    System.out.println(selectedTodo.get("L_CREATE_DT"));
	    return selectedTodo;
	}

}
