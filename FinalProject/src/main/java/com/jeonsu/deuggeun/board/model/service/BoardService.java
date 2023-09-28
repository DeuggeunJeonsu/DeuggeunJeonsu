package com.jeonsu.deuggeun.board.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.board.model.dto.Board;

public interface BoardService {

	/** 게시판 코드 조회
	 * @return BoardTypeList
	 */
	List<Map<String, Object>> selectBoardTypeList();

	/** 게시글 등록
	 * @param board
	 * @param images
	 * @param tagContents
	 * @param imgSrc
	 * @return boardNo
	 */
	int boardInsert(Board board, List<String> tagContent, String[] imgSrc);

	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectInformationBoardList(int boardCode, int cp);
	
	/** 게시글 목록 상세 검색
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectInformationBoardList(Map<String, Object> paramMap, int cp);

	/** 게시글 상세 조회
	 * @param map
	 * @return board
	 */
	Board selectInformationBoard(Map<String, Object> map);

	/** 좋아요 여부 확인
	 * @param map
	 * @return result
	 */
	int informationBoardLikeCheck(Map<String, Object> map);

	/** 좋아요 처리
	 * @param paramMap
	 * @return count
	 */
	int informationBoardLike(Map<String, Integer> paramMap);
	
	/** 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	int updateInformationBoardReadCount(int boardNo);

	/** 게시글 수정
	 * @param board
	 * @param cp
	 * @param tagContent
	 * @param imgSrc
	 * @param deleteList
	 * @return rowCount
	 */
	int informationBoardUpdate(Board board, int cp, List<String> insertList, List<String> imgSrc, String deleteList);

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	int informationBoardDelete(Map<String, Object> map);

}
