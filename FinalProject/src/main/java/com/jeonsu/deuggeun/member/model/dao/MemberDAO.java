package com.jeonsu.deuggeun.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	/** 안읽은 채팅 카운트
	 * @param memberNo
	 * @return chattingCount
	 */
	public int chattingCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.chattingCount", memberNo);
	}

	/** 장바구니 상품 카운트
	 * @param memberNo
	 * @return shoppingCount
	 */
	public int shoppingCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.shoppingCount", memberNo);
	}

	/** 회원가입 이메일 인증
	 * @param memberEmail
	 * @return
	 */
	public Member selectEmail(String memberEmail) {
		return sqlSession.selectOne("memberMapper.selectEmail",memberEmail);
	}


	/** 회원가입 이메일 인증 확인
	 * @param memberEmail
	 * @return
	 */
	public int checkKey(String memberEmail) {
		return sqlSession.selectOne("memberMapper.checkKey", memberEmail);
	}

	/** 메인페이지 전체 게시글 인기글 조회
	 * @return board
	 */
	public Board trendingAll() {
		return sqlSession.selectOne("freeBoardMapper.trendingAll");
	}

	/** 메인페이지 정보 공유 게시판 인기글 조회
	 * @return board
	 */
	public Board trendingInfo() {
		return sqlSession.selectOne("freeBoardMapper.trendingInfo");
	}

	/** 메인페이지 루틴 공유 게시판 인기글 조회
	 * @return board
	 */
	public Board trendingRoutine() {
		return sqlSession.selectOne("freeBoardMapper.trendingRoutine");
	}

	/** 메인페이지 자유 게시판 인기글 조회
	 * @return board
	 */
	public Board trendingFree() {
		return sqlSession.selectOne("freeBoardMapper.trendingFree");
	}

	/** 추천 루틴 투두리스트에 추가
	 * @param routine
	 * @return result
	 */
	public int surveyTodo(TodoList todoList) {

		int listCount = sqlSession.selectOne("todolistMapper.todoListCount", todoList);

		int result = 0;

		if(listCount < 10) {

			result = sqlSession.insert("todolistMapper.todoInsert",todoList );

			String createDT = sqlSession.selectOne("todolistMapper.calenderSelectRoutine", todoList);
	
			int result2 = 0;
			if(createDT==null) {
				result2 = sqlSession.insert("todolistMapper.calenderInsertRoutine", todoList);
			}
			if(result > 0 ) {
				result = sqlSession.insert("todolistMapper.todoDateInsertRoutine", todoList);
			}
		}

		return result;
	}

	/** 출석 랭킹
	 * @return attendenceRanking
	 */
	public List<Member> setAttendenceRanking() {
		List<Member> atList = sqlSession.selectList("memberMapper.setAttendenceRanking");
		return atList;
	}

	/** 투두리스트 실천랭킹
	 * @return todoListRanking
	 */
	public List<Member> setTodoListRanking() {
		List<Member> tdList = sqlSession.selectList("memberMapper.setTodoListRanking");
		return tdList;
	}

	/** 커뮤니티 활동랭킹
	 * @return communityRanking
	 */
	public List<Member> setCommunityRanking() {
		List<Member> cmList = sqlSession.selectList("memberMapper.setCommunityRanking");
		return cmList;
	}
	
	/** 출석일 증가
	 * @param memberNo
	 * @return
	 */
	public int attendencePlus(int memberNo) {
		return sqlSession.update("memberMapper.attendencePlus", memberNo);
	}
	

}
