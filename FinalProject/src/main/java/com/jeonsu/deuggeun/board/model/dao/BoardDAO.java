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
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시판 종류 목록 조회
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectBoardTypeList() {
		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}
	
	/** 게시판 게시글 삽입
	 * @param board
	 * @return boardNo(result)
	 */
	public int boardInsert(Board board) {
		int result = sqlSession.insert("informationBoardMapper.informationBoardInsert", board);
		
		if(result > 0) result = board.getBoardNo(); // result에 boardNo 대입
		
		return result;
	}

	/** 게시판 해시태그 삽입
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
			
			sqlSession.insert("informationBoardMapper.hashtagInsert", hashtag);

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
				
				result2 += sqlSession.insert("informationBoardMapper.hashtagInsert2", hashtag);
			}
			
		}
		
		return result2;
	}

	/** 게시판 이미지 삽입
	 * @param boardNo
	 * @param imgSrc
	 * @return boardNo(result)
	 */
	public int informationBoardImageInsert(int boardNo, String[] imgSrc) {
		
		int result = 0;
		
		BoardImage image = new BoardImage();
		
		if(imgSrc.length != 0) {
			String imgSrc2 = String.join("^^^", imgSrc);
			
			image.setImagePath("/resources/images/informationBoard/");
			image.setImageReName(imgSrc2);
			image.setImageOriginal("dg_image");
			image.setBoardNo(boardNo);
			image.setImageLevel(0);			

			result = sqlSession.insert("informationBoardMapper.informationBoardImageInsert", image);
		}
		
		return result;
	}

	/** 게시판 삭제되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("informationBoardMapper.getInformationBoardListCount", boardCode);
	}

	/** 게시판 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		List<Board> boardList = sqlSession.selectList("informationBoardMapper.selectInformationBoardList", boardCode, rowBounds);
		
		for(Board board : boardList) {
			
			if(board.getThumbnail() != null) {
				board.setThumbnail(board.getThumbnail().replace("^^^", ","));
			}
		}
		
		return boardList;
	}

	/** 게시판 게시글 상세 조회
	 * @param map
	 * @return board
	 */
	public Board selectInformationBoard(Map<String, Object> map) {
		return sqlSession.selectOne("informationBoardMapper.selectInformationBoard", map);
	}

	/** 게시판 조회 수 증가
	 * @param boardNo
	 * @return result
	 */
	public int updateInformationBoardReadCount(int boardNo) {
		return sqlSession.update("informationBoardMapper.updateInformationBoardReadCount", boardNo);
	}

	/** 게시판 좋아요 여부 확인
	 * @param map
	 * @return result
	 */
	public int informationBoardLikeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("informationBoardMapper.informationBoardLikeCheck", map);
	}

	/** 게시판 좋아요 처리
	 * @param paramMap
	 * @return result
	 */
	public int insertInformationBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.insert("informationBoardMapper.insertInformationBoardLike", paramMap);
	}

	/** 게시판 좋아요 취소(삭제)
	 * @param paramMap
	 * @return
	 */
	public int deleteInformationBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.delete("informationBoardMapper.deleteInformationBoardLike", paramMap);
	}

	/** 게시판 좋아요 수 조회
	 * @param integer
	 * @return
	 */
	public int countInformationBoardLike(Integer boardNo) {
		return sqlSession.selectOne("informationBoardMapper.countInformationBoardLike", boardNo);
	}

	/** 게시글 수정
	 * @param board
	 * @return
	 */
	public int informationBoardUpdate(Board board) {
		return sqlSession.update("informationBoardMapper.informationBoardUpdate", board);
	}
	
	/** 게시글 해시태그 수정
	 * @param board
	 * @return result
	 */
	public int hashtagUpdate(Board board) {
		return sqlSession.update("informationBoardMapper.hashtagUpdate",board);
	}

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	public int informationBoardDelete(Map<String, Object> map) {
		
		return sqlSession.update("informationBoardMapper.informationBoardDelete", map);
	}

	/** 게시글 삭제 시 해시태그 삭제
	 * @param map
	 * @return result
	 */
	public int informationBoardHashtagDelete(Map<String, Object> map) {
		return sqlSession.delete("informationBoardMapper.informationBoardHashtagDelete", map);
	}

	/** 게시글 삭제 시 프리뷰 이미지 삭제
	 * @param map
	 * @return result
	 */
	public int informationBoardImageDelete(Map<String, Object> map) {
		return sqlSession.delete("informationBoardMapper.informationBoardImageDelete", map);
	}


	/** 게시글 수 조회(검색)
	 * @param paramMap
	 * @return result
	 */
	public int getInformationBoardListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("informationBoardMapper.getInformationBoardListCount_search", paramMap);
	}

	/** 게시판 게시글 상세 검색
	 * @param pagination
	 * @param paramMap
	 * @return list
	 */
	public List<Board> selectInformationBoardList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("informationBoardMapper.selectInformationBoardList_search", paramMap, rowBounds);
	}

}
