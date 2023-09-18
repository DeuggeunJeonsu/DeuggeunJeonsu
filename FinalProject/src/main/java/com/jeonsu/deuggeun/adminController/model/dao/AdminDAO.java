package com.jeonsu.deuggeun.adminController.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<AdminMember> selectMember() {
		return sqlSession.selectList("adminMapper.selectMember", null);
	}

}
