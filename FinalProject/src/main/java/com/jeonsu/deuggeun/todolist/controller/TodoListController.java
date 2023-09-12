package com.jeonsu.deuggeun.todolist.controller;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") int loginMemberNo) {
	    List<Map<String, Object>> todoList = service.selectTodoListAll();
	    
	    System.out.println(todoList);
	    return todoList;
	}

}
