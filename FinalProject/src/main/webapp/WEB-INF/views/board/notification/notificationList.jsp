<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 공지사항 게시글 목록 조회 시 필요한 변수 선언 --%>
<c:set var="boardList" value="${map.boardList}" />
<c:set var="pagination" value="${map.pagination}" />



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시판</title>

<link rel="stylesheet"
	href="/resources/css/board/notification/notificationList.css">
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon_io/apple-touch-icon.png">

<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest"
	href="/resources/images/favicon_io/site.webmanifest">
</head>

<body>
	<main>


		<c:if test="${!empty param.searchTitle}">
            <c:set var="sp" value="&searchTitle=${param.searchTitle}"  />
        </c:if>

		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		
		<form action="/notification" method="GET"></form>

			<div id="notificationList-margin"></div>

			<div class="Jbody">
				<div class="Jcenter">


					<div class="Jhead">
						<h1>공지사항 게시판</h1>
					</div>

					<div class="Jtext">득근전수에서 회원님들에게 공지드립니다.</div>

					<form action="/board/4/list" method="get"> 
						<div class="search-place">
							<input type="search" id="market-search" name="searchTitle" placeholder="search...">
							<button id="search-button">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>

					<div id="ListArea">
						<div class="JList">

							<table>
								<thead>

									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성날짜</th>
										<th>조회수</th>
									</tr>
								</thead>

								<tbody>

									<c:choose>

									<c:when test="${empty boardList}">
											<tr>
												<th id="noPage" colspan="6">
													페이지가 존재하지 않습니다.
												</th>
											</tr>
									</c:when>
										
									<c:otherwise>
											<c:forEach items="${boardList}" var="board">
													<tr>
														<td>${board.boardNo}</td>
														<td><a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${cp}${sp}">${board.boardTitle}</a></td>
														<td>${board.memberNickname}</td>
														<td>${board.boardCreateDate}</td>
														<td>${board.readCount}</td>
													</tr>
											</c:forEach>
									</c:otherwise>
									</c:choose>

								</tbody>
							</table>

						</div>
					</div>

					<div class="board-Jbtn">
						<%-- 관리자 상태일 경우일 시 버튼 노출 --%>
						<c:if test="${loginMember.authority == 2}" >
							<a href="/board/${boardCode}/list/notificationWrite"><button
								type="button" id="writeBtn">글쓰기</button></a>
						</c:if> 
					</div>

					<div class="pagination-area">


                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/board/${boardCode}/list?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/board/${boardCode}/list?cp=${pagination.prevPage}${sp}">&lt;</a></li>

               
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}"
                            end="${pagination.endPage}" step="1">

                            <c:choose>

                               <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                               </c:when>
                            
                               <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/board/${boardCode}/list?cp=${i}${sp}">${i}</a></li>
                               </c:otherwise>
                            </c:choose>
                            
                    </c:forEach>
                    
                   
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/board/${boardCode}/list?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/board/${boardCode}/list?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                </ul>
            </div>

				</div>
			</div>
		 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</main>
</body>

	

</html>