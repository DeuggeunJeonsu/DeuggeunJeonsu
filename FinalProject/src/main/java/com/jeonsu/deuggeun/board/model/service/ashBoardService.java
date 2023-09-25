package com.jeonsu.deuggeun.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dto.Board;

public interface ashBoardService {

	
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
	 * @return
	 */
	Map<String, Object> selectFreeBoardList(int boardCode, int cp);

	/** 게시글 상세 조회
	 * @param map
	 * @return board
	 */
	Board selectFreeBoard(Map<String, Object> map);

	/** 좋아요 여부 확인
	 * @param map
	 * @return result
	 */
	int freeBoardLikeCheck(Map<String, Object> map);

	/** 좋아요 처리
	 * @param paramMap
	 * @return count
	 */
	int freeBoardLike(Map<String, Integer> paramMap);
	
	/** 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	int updateFreeBoardReadCount(int boardNo);

	/** 게시글 수정
	 * @param board
	 * @param cp
	 * @param tagContent
	 * @param imgSrc
	 * @param deleteList
	 * @return rowCount
	 */
	int freeBoardUpdate(Board board, int cp, List<String> insertList, List<String> imgSrc, String deleteList);

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	int freeBoardDelete(Map<String, Object> map);

	/** 팔로우 여부 확인
	 * @param map
	 * @return int
	 */
	int memberFollowCheck(Map<String, Object> map);

	/** 멤버 팔로우
	 * @param paramMap
	 * @return result
	 */
	int memberFollow(Map<String, Integer> paramMap);

	/** 멤버 언팔로우
	 * @param paramMap
	 * @return result
	 */
	int memberUnfollow(Map<String, Integer> paramMap);

	/** 자유게시판 게시글 상세 검색
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectFreeBoardList(Map<String, Object> paramMap, int cp);

}
