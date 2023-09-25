package com.jeonsu.deuggeun.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 로그인 DAO
	 * @param inputMember
	 * @return 회원 정보 또는 null
	 */
	public Member login(Member inputMember) {
		return sqlSession.selectOne("memberMapper.login", inputMember);
	}
	
	/** 전화번호로 아이디 찾기
	 * @param memberTel
	 * @return selectMember
	 */
	public Member selectMemberByTel(String memberTel) {
		return sqlSession.selectOne("memberMapper.selectMemberByTel",memberTel);
	}
	
	/** 아이디(이메일)로 회원 찾기
	 * @param memberEmail
	 * @return selectMember
	 */
	public Member selectMemberByEmail(String memberEmail) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail",memberEmail);
	}
	
	/** email인증 후 비밀번호 변경
	 * @param paramMap
	 * @return result
	 */
	public int changePw(Map<String, Object> paramMap) {
		return sqlSession.update("memberMapper.changePw",paramMap);
	}

	/** 회원 가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}

	/** 회원 BMI 히스토리 불러오기
	 * @param paramMap
	 * @return bmiHistorys
	 */
	public List<MemberBMI> loadBMI(Map<String, Object> paramMap) {		
		return sqlSession.selectList("memberMapper.selectBMI", paramMap);
	}
	
	/** 회원 정보에 BMI 히스토리 추가/업데이트하기
	 * @param paramMap
	 * @return result
	 */
	public int addBMI(Map<String, Object> paramMap) {
		// 오늘날짜에 저장된 BMI 히스토리가 있는지
		int checkResult = sqlSession.selectOne("memberMapper.checkBMI", paramMap);

		// 없으면 insert, 있으면 update
		if(checkResult==0) return sqlSession.insert("memberMapper.insertBMI", paramMap);
		else return sqlSession.update("memberMapper.updateBMI", paramMap);
	}

<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> d78e07ff12542d3ed96d496f5499c5e9b7dab7f7
	public int shoppingCount(int memberNo) {

		return sqlSession.selectOne("memberMapper.shoppingCount", memberNo);
	}
<<<<<<< HEAD
=======
=======

>>>>>>> d78e07ff12542d3ed96d496f5499c5e9b7dab7f7
	/** 회원가입 이메일 인증
	 * @param memberEmail
	 * @return
	 */
	public Member selectEmail(String memberEmail) {
		return sqlSession.selectOne("memberMapper.selectEmail",memberEmail);
	}

<<<<<<< HEAD
>>>>>>> 6cfc7017399467906209bbdbf3c13b5006d77ce4
=======
>>>>>>> d78e07ff12542d3ed96d496f5499c5e9b7dab7f7
}
