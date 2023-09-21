package com.jeonsu.deuggeun.common.scheduling;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.jeonsu.deuggeun.board.model.service.BoardService;
import com.jeonsu.deuggeun.board.model.service.ljyBoardService;

//@Component
public class ImageDeleteScheduling {
	
//	@Autowired
//	private ServletContext servletContext;
//	
//	@Autowired
//	private ljyBoardService service;
//	
//	@Scheduled(cron = "0 0 * * * *") // 매 정시 (*시 0분 0초)
//	public void test() {
//
//		System.out.println("----------게시판 DB, 서버가 불일치하는 파일 제거------------");
//		
//		String filePath= servletContext.getRealPath("/resources/images/board");
//		
//		File path = new File(filePath);
//		File[] imageArr = path.listFiles();
//
//		List<File> serverImageList = Arrays.asList(imageArr);
//		
//		
//		
//		List<String> dbImageList = service.selectImageList();
//		
//		
//		if(!serverImageList.isEmpty()) {
//			
//			for(File server : serverImageList) {
//				
//
//				if(dbImageList.indexOf(server.getName()) == -1){
//					
//					System.out.println(server.getName() + "삭제");
//					server.delete(); //File.delete() : 파일 삭제
//				}
//			} 
//			 System.out.println("-----------이미지 파일 삭제 스케줄러 종료----------------");
//			
//		}
//	}

}