package com.jeonsu.deuggeun.adminController.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.adminController.model.dao.AdminDAO;
import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;

@Service
public class AdminServiceimpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Override
	public Map<String, Object> selectMember() {
		
		List<AdminMember> memberList = dao.selectMember();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberList", memberList);
		
		
		return map;
	}

}
