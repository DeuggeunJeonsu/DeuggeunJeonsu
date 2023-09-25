<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="boardList" value="${map.boardList}" />


			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>회원 문의 목록</title>

				<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
				<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
				<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
				<link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

				<link rel="stylesheet" href="/resources/css/admin/adminInquiry.css">

				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
			</head>

			<body>
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
				<main>

					<div class="adminBody">

						<section id="inquiryModal">
							<h1 class="modal-header">내가 작성한 문의글</h1>
							<div id="modal-header2">회원님이 작성하신 문의 글입니다.🍀</div>

							<hr>
							<br>
								<div>
									<input type="text" id="modalTitle" name="boardTitle"  readOnly value="${board.boardTitle}">
								</div>

								<div>
									<textarea name="boardContent" id="modalContent" cols="30" rows="10"
										 readOnly>${board.boardContent}</textarea>
								</div>

							<br>
							<div class="bottom">
								<div>
									<button id="close-button">닫기</button>
									<button id="insert-button">답변하기</button>
								</div>
							</div>

						</section>

						<div class="adminBody2">


							<div class="adminSide">
								<div id="fristSide">
									<div class="adminImg">
										<img
											src="data:image/jpeg;base64,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">
									</div>
									관리자님

								</div>
								<a href="/admin/userList">
									<div class="sideList" id="user-sideList">회원 목록</div>
								</a> <a href="/admin/adminInquiry">
									<div class="sideList" id="inquiry-sideList">회원 문의</div>
								</a> <a href="/admin/adminBoardList">
									<div class="sideList" id="boardList-sideList">관리자 페이지</div>
								</a>
							</div>

							<div class="userList">
								<div class="Jhead">
									<h2 id="inquiryHeader">회원 문의 목록</h2>
								</div>


								<div class="userSearch">
									<span id="option1">1:1문의</span>
									&nbsp; | &nbsp;
									<span id="option2">상품 문의</span>

								</div>


								<table>
									<thead>

										<tr>
											<th>문의글 번호</th>
											<th>제목</th>
											<th>구분</th>
											<th>회원이메일</th>
											<th>답변 여부</th>
										</tr>
									</thead>

									<tbody id="inquiryList">

										<c:if test="${empty boardList }">
											<tr>
												<td  colspan="6">
													<strong>문의글이 존재하지 않습니다.</strong>
												</td>
											</tr>
										</c:if>

										<c:if test="${!empty boardList }">
											<c:forEach items="${boardList}" var="board">
												<tr>
													<td>${board.boardNo}</td>
													<td><a href="#" class="iq-update">${board.boardTitle}</a></td>
													<td class="inquiryType">${board.inquiryType}</td>
													<td>${board.memberEmail}</td>



													<td class="complete adminCheckFl">${board.adminCheckFl}</td>



												</tr>


												<input type="hidden" class="boardNo" value="${board.boardNo}" />

												<input type="hidden" class="adminCheckFl2" value="${board.adminCheckFl}" />
												<input type="hidden" class="inquiryType2" value="${board.inquiryType}" />


											</c:forEach>
										</c:if>

									


									</tbody>
								</table>



							</div>

						</div>

					</div>

				</main>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


				<script src="/resources/js/board/admin/adminInquiry.js"></script>

			</body>

			</html>