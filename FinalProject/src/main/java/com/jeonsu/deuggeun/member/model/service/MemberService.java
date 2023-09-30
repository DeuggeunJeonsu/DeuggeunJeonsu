package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

public interface MemberService {

	/** 로그인 서비스
	 * @param inputMember (email, pw)
	 * @return email, pw가 일치하는 회원 정보 또는 null
	 */
	Member login(Member inputMember);

	/** 회원 가입 서비스(비밀번호 암호화 필요)
	 * @param inputMember
	 * @return result(0 : 실패, 1 : 성공)
	 */
	int signUp(Member inputMember);

	/** 전화번호로 아이디 찾기
	 * @param memberTel
	 * @return selectMember
	 */
	Member selectMemberByTel(String memberTel);
	
	/** 아이디(이메일)로 회원 찾기
	 * @param memberEmail
	 * @return selectMember
	 */
	Member selectMemberByEmail(String memberEmail);
	
	/** email인증 후 비밀번호 변경
	 * @param paramMap
	 * @return result(0 : 실패, 1 : 성공)
	 */
	int changePw(Map<String, Object> paramMap);
	
	/** 회원 BMI 히스토리 불러오기
	 * @param paramMap
	 * @return BmiHistorys
	 */
	List<MemberBMI> loadBMI(Map<String, Object> paramMap);
	
	/** 회원 정보에 BMI 히스토리 추가/업데이트하기
	 * @param paramMap
	 * @return result(0 : 실패, 1 : 성공)
	 */
	int addBMI(Map<String, Object> paramMap);

	/** 안읽은 채팅 카운트
	 * @param memberNo
	 * @return chattingCount
	 */
	int chattingCount(int memberNo);

	/** 장바구니 상품 카운트
	 * @param memberNo
	 * @return shoppingCount
	 */
    int shoppingCount(int memberNo);

	/** 회원가입 이메일 인증
	 * @param memberEmail
	 * @return
	 */
	Member selectEmail(String memberEmail);

	/** 회원가입 이메일 인증확인
	 * @param paramMap
	 * @return
	 */
	int checkKey(String memberEmail);

	/** 메인페이지 전체 게시글 인기글 조회
	 * @return board
	 */
	Board trendingAll();

	/** 메인페이지 정보 공유 게시판 인기글 조회
	 * @return board
	 */
	Board trendingInfo();

	/** 메인페이지 루틴 공유 게시판 인기글 조회
	 * @return board
	 */
	Board trendingRoutine();

	/** 메인페이지 자유 게시판 인기글 조회
	 * @return board
	 */
	Board trendingFree();

	
	/** 추천 루틴 todoList에 추가
	 * @param todoList
	 * @return result
	 */
	int surveyTodo(TodoList todoList);

	/** 출석 랭킹
	 * @return attendenceRanking
	 */
	List<Member> setAttendenceRanking();

	/** 투두리스트 실천랭킹
	 * @return todoListRanking
	 */
	List<Member> setTodoListRanking();

	/** 커뮤니티 활동랭킹
	 * @return communityRanking
	 */
	List<Member> setCommunityRanking();


}
