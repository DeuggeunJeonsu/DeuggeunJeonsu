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

}
