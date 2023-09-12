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
	public List<Map<String, Object>> TodoList(@RequestParam("memberNo") int loginMemberNo) {
	    List<Map<String, Object>> todoList = service.selectTodoListAll();
	    
	    for (Map<String, Object> todoItem : todoList) {
	    
	    	// "LIST_NO"와 "L_CREATE_DT" 값을 추출
	        int listNo = (int) todoItem.get("LIST_NO");
	        String createDate = (String) todoItem.get("L_CREATE_DT");
	        
	        // 추출한 값으로 원하는 작업 수행
	        System.out.println("LIST_NO: " + listNo);
	        System.out.println("L_CREATE_DT: " + createDate);
	        
	        // 여기서 필요한 작업을 수행하십시오.
	    }
	   

	   
	    return todoList;
	}

}
