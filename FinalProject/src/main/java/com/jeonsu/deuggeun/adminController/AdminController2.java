package com.jeonsu.deuggeun.adminController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.adminController.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController2 {
	
	@Autowired
	private AdminService service;
	
	@PostMapping("/userDel")
	@ResponseBody
	public int userDel(@RequestBody AdminMember member) {
		
		System.out.println(member.getMemberNo());
		
		int result = service.userDel(member); 
		
		return result;
	}

}
