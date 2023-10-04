package com.jeonsu.deuggeun.adminController.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.adminController.model.dto.AdminMember;
import com.jeonsu.deuggeun.board.model.dto.Board;

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


	/** 1:1 문의 리스트 조회
	 * @return
	 */
	public List<AdminMember> selectInquiry1() {
		return sqlSession.selectList("adminMapper.selectInquiry1", null);
	}
	
	/** 상품 문의 리스트 조회
	 * @return boardList
	 */
	public List<AdminMember> selectInquiry2() {
		return sqlSession.selectList("adminMapper.selectInquiry2", null);
	}


	/** 관리자 1:1 문의 답변
	 * @param board
	 * @return
	 */
	public int insertQnA(AdminMember board) {
		return sqlSession.insert("adminMapper.insertQnA", board);
	}


	/** 문의 관리자 답변 여부 변경
	 * @param board
	 * @return result
	 */
	public int updateQnA(AdminMember board) {
		return sqlSession.update("adminMapper.updateQnA", board);
	}


	/** 상품 문의 답변
	 * @param board
	 * @return
	 */
	public int marketInWrite(AdminMember board) {
		
		int boardNo = sqlSession.selectOne("adminMapper.marketInWriteBoardNo", null);
		
		if(boardNo != 0) {
			board.setBoardNo(boardNo);
		}
		return sqlSession.update("adminMapper.marketInWrite", board);
		
	}


	/** 1:1 문의 상세조회
	 * @param board
	 * @return
	 */
	public AdminMember adminInquiryDetail(int boardNo) {
		return sqlSession.selectOne("adminMapper.adminInquiryDetail", boardNo);
	}


	/** 상품 문의 목록 조회
	 * @return
	 */
	public List<AdminMember> selectInquiryList2() {
		return sqlSession.selectList("adminMapper.selectInquiry2", null);
	}


	/** 상품 상세 조회
	 * @param inquiryNo
	 * @return
	 */
	public AdminMember marketDetail(int inquiryNo) {
		return sqlSession.selectOne("adminMapper.marketDetail", inquiryNo);
	}


	/** 상품 문의 답변 여부 변경
	 * @param board
	 * @return result
	 */
	public int updateMarket(AdminMember board) {
		return sqlSession.update("adminMapper.updateMarket", board);
	}





}
