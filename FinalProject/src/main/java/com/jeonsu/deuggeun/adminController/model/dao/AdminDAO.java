package com.jeonsu.deuggeun.adminController.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 회원 목록 조회
	 * @return memberList
	 */
	public List<AdminMember> selectMember() {
		return sqlSession.selectList("adminMapper.selectMember", null);
	}


	/** 회원 탈퇴
	 * @param member
	 * @return result
	 */
	public int userDel(AdminMember member) {
		return sqlSession.update("adminMapper.userDel", member);
	}


	/** 회원 문의 목록 조회
	 * @return boardList
	 */
	public List<AdminMember> selectInquiryList() {
		return sqlSession.selectList("adminMapper.selectInquiryList", null);
	}

}
