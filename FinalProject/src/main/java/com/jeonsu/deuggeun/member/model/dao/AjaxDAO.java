  package com.jeonsu.deuggeun.member.model.dao;
  
  import org.mybatis.spring.SqlSessionTemplate; import
  org.springframework.beans.factory.annotation.Autowired; import
  org.springframework.stereotype.Repository;
  
  @Repository
  public class AjaxDAO {
  
	  @Autowired
	  private SqlSessionTemplate sqlSession;
	  
	  public int checkEmail(String email) {
		  return sqlSession.selectOne("ajaxMapper.checkEmail", email); 
	  }

	public int checkNickname(String nickname) {
		return sqlSession.selectOne("ajaxMapper.checkNickname",nickname);
	}
	  
  }