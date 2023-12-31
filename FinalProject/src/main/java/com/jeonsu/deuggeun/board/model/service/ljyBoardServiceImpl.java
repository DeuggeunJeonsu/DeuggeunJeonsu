package com.jeonsu.deuggeun.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dao.ljyBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.BoardImage;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.board.model.dto.Routine;
import com.jeonsu.deuggeun.common.utility.Util;



import com.jeonsu.deuggeun.board.model.exception.FileUploadException;

@Service
public class ljyBoardServiceImpl implements ljyBoardService{


	@Autowired
	private ljyBoardDAO dao;


	/** 게시글 목록 조회
	 *@param boardCode
	 *@param cp
	 *@return map
	 */
	@Override
	public Map<String, Object> selectShareBoardList(int boardCode, int cp) {

		//게시글 수 조회
		int listCount = dao.getListCont(boardCode);

		// 페이지네이션 
		Pagination pagination = new Pagination(cp, listCount);

		List<Board> boardList = dao.selectBoardList(pagination, boardCode);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}


	/** 공유게시판 게시글 목록 조회 
	 *
	 */
	@Override
	public Board selectShareBoard(Map<String, Object> map) {
		return dao.selectShareBoard(map);
	}

	// 좋아요 여부확인
	@Override
	public int shareBoardLikeCheck(Map<String, Object> map) {
		return dao.freeBoardLikeCheck(map);
	}

	// 좋아요 처리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int shareBoardLike(Map<String, Integer> paramMap) {
		int result = 0;

		if(paramMap.get("check") == 0) {
			result = dao.insertFreeBoardLike(paramMap);

		} else {
			result = dao.deleteFreeBoardLike(paramMap);			
		}

		if(result == 0) return -1;

		int count = dao.countFreeBoardLike(paramMap.get("boardNo"));

		return count;
	}

	//조회수 증가 
	@Override
	public int updateShareBoardReadCount(int boardNo) {
		return dao.updateBoardReadCount(boardNo);
	}
	
	// 자유게시판 게시글 상세 검색
	@Override
	public Map<String, Object> selectFreeBoardList(Map<String, Object> paramMap, int cp) {
		
		// 검색된 게시글 수 조회
		int listCount = dao.getShareBoardListCount(paramMap);
		
		// 페이지네이션
		Pagination pagination = new Pagination(cp, listCount);
		
		// 현재 페이지에 해당하는 게시글 목록만 조회
		List<Board> boardList = dao.selecShareBoardList(pagination, paramMap);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}
			
	
	

	//----------------------------------------------------
	/*board2*/
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int boardInsert(Board board, List<MultipartFile> images, String webPath, String filePath, List<Routine> routines) 
			throws IllegalStateException, IOException{

		// 0. XSS방지 처리 
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.newLineHandling(board.getBoardContent()));

		// 1. BOARD 테이블에 INSER하기 (제목, 내용, 작성자, 게시판 코드)
		// -> boardNo (시퀀스로 생성한 번호) 반환 
		int boardNo = dao.boardInsert(board);

		// 해시태그 insert 
		int result2 = dao.hashtagInsert(board);

		// 2. 게시글 삽입 성공시 
		// 업로드 되는 이미지가 있다면 BOARD_IMG 테이블에 삽입하는 DAO 호출
		if(boardNo > 0 ) { //게시글 성공 시

			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단, 업로드된 파일이 없어도 MultipartFile 객체는 존재

			// 실제로 업로드된 파일을 기록할 List
			List<BoardImage> uploadList = new ArrayList<BoardImage>();

			// images에 담겨 있는 파일 중에서 실제로 업로드된 파일 만 분류
			for(int i= 0; i <images.size(); i++) {

				//i 번째 요소에 업로드한 파일이 있다면
				if(images.get(i).getSize() > 0) {

					BoardImage img = new BoardImage();

					//img에 파일 정보를 담아서 uploadList에 추가 
					img.setImagePath(webPath); //웹 접근 경로
					img.setBoardNo(boardNo); //게시글 번호 
					img.setImageLevel(i); //이미지 순서

					//파일 원본명
					String fileName = images.get(i).getOriginalFilename();

					img.setImageOriginal(fileName); //원본명
					img.setImageReName(Util.fileRename(fileName)); // 변경명

					uploadList.add(img);
				}
			} // 분류하는 for문 종료

			if(!uploadList.isEmpty()) {

				int result = dao.insertImageList(uploadList);

				if(result == uploadList.size()) {
					for(int i =0; i <uploadList.size(); i++) {

						int index = uploadList.get(i).getImageLevel();


						// 파일로 변환 
						String rename = uploadList.get(i).getImageReName();

						images.get(index).transferTo(new File(filePath+ rename));
					}
				}else {
					throw new FileUploadException(); //예외 강제 발생
				}
			}

			for(int i = 0 ; i < routines.size() ; i++) {
				routines.get(i).setBoardNo(boardNo);
			}

			// 루틴 insert
			if(!routines.isEmpty()) {
				int result = dao.insertRoutineList(routines);
			}
		}
		return boardNo;

	}


	//DB이미지 파일 목록 조회
	@Override
	public List<String> selectImageList() {
		return dao.selectImageList();
	}


	// 게시글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int shareboardDelete(Map<String, Object> map) {

		// 게시글 내용 삭제
		int result = dao.shareBoardDelete(map);

		// 게시글 내용 삭제에 성공했을 때
		if(result > 0) {

			// 게시글에 포함되어 있던 루틴/이미지 삭제
			result += dao.shareBoardHashtagDelete(map);
			result += dao.routineDelete(map);
			result += dao.shareBoardImageDelete(map);
		}

		return result;
	}

	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardUpdate(Board board, List<MultipartFile> images, String webPath, String filePath,List<Routine> routines, String deleteList, String deleteImgList) throws IllegalStateException, IOException {

		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.newLineHandling(board.getBoardContent()));
		
		int rowCount =  dao.boardUpdate(board);
		int routineUpdate = 0; 
		
		// 게시글의 제목과 내용을 업로드 성공했을 때
		if(rowCount > 0) {
			List<BoardImage> uploadList = new ArrayList<BoardImage>();
			// 게시글 이미지 삭제 
			if(!deleteList.equals("")) {
				Map<String,Object> deleteMap = new HashMap<String, Object>();
				deleteMap.put("boardNo", board.getBoardNo());
				deleteMap.put("deleteImgList", deleteImgList);
				deleteMap.put("deleteList", deleteList);
				
				rowCount = dao.imgDelete(deleteMap);
				rowCount = dao.rtDelete(deleteMap);
				
			}

			for(int i = 0; i <images.size(); i++) {
				

				if(images.get(i).getSize() > 0) {

					BoardImage img = new BoardImage();

					img.setImagePath(webPath);
					img.setBoardNo(board.getBoardNo());
					img.setImageLevel(i); //이미지 순서 

					String fileName = images.get(i).getOriginalFilename();
					
					img.setImageOriginal(fileName); //원본명
					img.setImageReName(Util.fileRename(fileName)); // 변경명
					
					uploadList.add(img);

					rowCount = dao.imageUpdate(img);
					
					

					if(rowCount == 0) {
						rowCount = dao.insertImage(img);
					}
				}
			}
			
			// 루틴 수정 삭제 
			for(int i = 0 ; i < routines.size() ; i++) {
				
				routines.get(i).setBoardNo(board.getBoardNo());
				
				routineUpdate = dao.routineUpdate(routines.get(i));
				
				if(routineUpdate == 0) {
					routineUpdate = dao.insertRoutine(routines.get(i));
				}
			}
			

			if(!uploadList.isEmpty()) {
				for(int i=0 ; i < uploadList.size() ; i++) {

					int index = uploadList.get(i).getImageLevel();

					// 파일로 변환
					String rename = uploadList.get(i).getImageReName();

					images.get(index).transferTo(new File(filePath + rename));
				}
			}
		}

		return rowCount;

	}
}

