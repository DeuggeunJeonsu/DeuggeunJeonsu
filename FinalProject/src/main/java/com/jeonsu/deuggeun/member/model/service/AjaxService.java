  package com.jeonsu.deuggeun.member.model.service;
  public interface AjaxService {
	  /** 이메일 중복 검사
	  @param email
	  @return count
	  */
	  int checkEmail(String email);

	/** 닉네임 중복 검사
	 * @param nickname
	 * @return
	 */
	int checkNickname(String nickname);
  }
