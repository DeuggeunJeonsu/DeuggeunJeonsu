package com.jeonsu.deuggeun.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.BoardImage;
import com.jeonsu.deuggeun.board.model.dto.Hashtag;
import com.jeonsu.deuggeun.board.model.dto.Pagination;

@Repository
public class ashBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 자유게시판 게시글 삽입
	 * @param board
	 * @return boardNo(result)
	 */
	public int boardInsert(Board board) {
		int result = sqlSession.insert("freeBoardMapper.freeBoardInsert", board);
		
		if(result > 0) result = board.getBoardNo(); // result에 boardNo 대입
		
		return result;
	}

	/** 자유게시판 해시태그 삽입
	 * @param boardNo
	 * @param tagContent
	 * @return boardNo(result)
	 */
	public int hashtagInsert(int boardNo, List<String> tagContent) {
		
		// 1. 해시태그 HASHTAG 테이블에 삽입
		// 시퀀스 생성 때문에 이 테이블에 먼저 삽입해야 함!
		
		int result = 0;
		
		List<Hashtag> tagList = new ArrayList<Hashtag>();
		
		for(int i=0; i<tagContent.size(); i++) {
			
			Hashtag hashtag = new Hashtag();
			
			hashtag.setTagContent(tagContent.get(i));
			
			sqlSession.insert("freeBoardMapper.hashtagInsert", hashtag);

			// 생성된 해시태그 번호 얻어오기
			int generatedTagNo = hashtag.getTagNo();
			
			tagList.add(hashtag);
			
			result++;
		}

		// 2. 해시태그 BOARD_HASHTAG 테이블에 삽입
		
		int result2 = 0;
		
		// 1번에 성공했을 경우
		if(result > 0) {
			
			for(Hashtag hashtag : tagList) {
				
				hashtag.setBoardNo(boardNo);
				
				result2 += sqlSession.insert("freeBoardMapper.hashtagInsert2", hashtag);
			}
			
		}

		if(result2 > 0) result2 = boardNo;
		
		return result2;
	}

	/** 자유게시판 이미지 삽입
	 * @param boardNo
	 * @param imgSrc
	 * @return boardNo(result)
	 */
	public int freeBoardImageInsert(int boardNo, List<String> imgSrc) {
		
		int result = 0;
		
		List<BoardImage> imageList = new ArrayList<>();
		
		for(int i=0; i<imgSrc.size(); i++) {
			
			BoardImage image = new BoardImage();
			
			image.setImagePath("/resources/images/freeBoard/");
			image.setImageReName(imgSrc.get(i));
			image.setImageOriginal("dg_image");
			image.setBoardNo(boardNo);
			image.setImageLevel(i);
			
			sqlSession.insert("freeBoardMapper.freeBoardImageInsert", image);
		}
		
		if(result > 0) result = boardNo;
		
		return result;
	}

	/** 자유게시판 삭제되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("freeBoardMapper.getFreeBoardListCount", boardCode);
	}

	/** 자유게시판 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("freeBoardMapper.selectFreeBoardList", boardCode, rowBounds);
	}

	/** 자유게시판 게시글 상세 조회
	 * @param map
	 * @return board
	 */
	public Board selectFreeBoard(Map<String, Object> map) {
		return sqlSession.selectOne("freeBoardMapper.selectFreeBoard", map);
	}

	/** 자유게시판 조회 수 증가
	 * @param boardNo
	 * @return result
	 */
	public int updateFreeBoardReadCount(int boardNo) {
		return sqlSession.update("freeBoardMapper.updateFreeBoardReadCount", boardNo);
	}

	/** 자유게시판 좋아요 여부 확인
	 * @param map
	 * @return result
	 */
	public int freeBoardLikeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("freeBoardMapper.freeBoardLikeCheck", map);
	}

	/** 자유게시판 좋아요 처리
	 * @param paramMap
	 * @return result
	 */
	public int insertFreeBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.insert("freeBoardMapper.insertFreeBoardLike", paramMap);
	}

	/** 자유게시판 좋아요 취소(삭제)
	 * @param paramMap
	 * @return
	 */
	public int deleteFreeBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.delete("freeBoardMapper.deleteFreeBoardLike", paramMap);
	}

	/** 자유게시판 좋아요 수 조회
	 * @param integer
	 * @return
	 */
	public int countFreeBoardLike(Integer boardNo) {
		return sqlSession.selectOne("freeBoardMapper.countFreeBoardLike", boardNo);
	}

	/** 게시글 수정
	 * @param board
	 * @return
	 */
	public int freeBoardUpdate(Board board) {
		return sqlSession.update("freeBoardMapper.freeBoardUpdate", board);
	}

	/** 게시글 수정 시 삭제된 해시태그 BOARD_HASHTAG 테이블에서 삭제
	 * @param deleteMap
	 * @return
	 */
	public int hashtagDelete(Map<String, Object> deleteMap) {
		return sqlSession.delete("freeBoardMapper.hashtagDelete", deleteMap);
	}
	
	/** 게시글 수정 시 삭제된 해시태그 HASHTAG 테이블에서 삭제
	 * @param deleteMap
	 * @return
	 */
	public int hastagDelete2(Map<String, Object> deleteMap) {
		return sqlSession.delete("freeBoardMapper.hashtagDelete2", deleteMap);
	}

	/** 게시글 수정 시 해시태그 추가
	 * @param boardNo
	 * @param insertList
	 * @return
	 */
	public int hashtagUpdate(int boardNo, List<String> insertList) {
		
		// 1. 추가된 해시태그 HASHTAG 테이블에 삽입
		
		int result = 0;
		
		List<Hashtag> tagList = new ArrayList<Hashtag>();
		
		for(int i=0; i<insertList.size(); i++) {
			
			Hashtag hashtag = new Hashtag();
			
			hashtag.setTagContent(insertList.get(i));
			
			sqlSession.insert("freeBoardMapper.hashtagInsert", hashtag);

			int generatedTagNo = hashtag.getTagNo();
			
			tagList.add(hashtag);
			
			result++;
		}
		
		// 2. 추가된 해시태그 BOARD_HASHTAG 테이블에 삽입
		int result2 = 0;
		
		if(result > 0) {
			
			for(Hashtag hashtag : tagList) {
				
				hashtag.setBoardNo(boardNo);
				
				result2 += sqlSession.insert("freeBoardMapper.hashtagInsert2", hashtag);
			}
			
		}

		if(result2 > 0) result2 = boardNo;
		
		return result2;
	}

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	public int freeBoardDelete(Map<String, Object> map) {
		
		return sqlSession.update("freeBoardMapper.freeBoardDelete", map);
	}

	/** 게시글 삭제 시 해시태그 삭제
	 * @param map
	 * @return result
	 */
	public int freeBoardHashtagDelete(Map<String, Object> map) {
		return sqlSession.delete("freeBoardMapper.freeBoardHashtagDelete", map);
	}

}
