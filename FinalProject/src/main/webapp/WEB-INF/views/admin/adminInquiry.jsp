<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="boardList" value="${map.boardList}" ></c:set>
	<c:set var="marketList" value="${map.marketList}" ></c:set>


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
										<%-- 프로필 이미지 X --%>
										<c:if test="${empty loginMember.profileImage}" >
											<img src="/resources/images/user.png" id="profileImage">
										</c:if>
						
										<%-- 프로필 이미지 O --%>
										<c:if test="${!empty loginMember.profileImage}" >
											<img src="${loginMember.profileImage}" id="profileImage">
										</c:if>
									</div>
									${loginMember.memberNickname}

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
											<th class="marketNo">문의글/상품 번호</th>
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

											<c:forEach items="${marketList}" var="market">
                                                <tr>
                                                    <td>${market.productNo}</td>
                                                    <td ><a href="#" class="iq-update2">${market.inquiryTitle}</a></td>
                                                    <td class="marketIt1">${market.inquiryType}</td>
                                                    <td>${market.memberEmail}</td>
                                                    <td class="marketCheckFL1">${market.marketCheckFl}</td>
                                                </tr>
                                                <input type="hidden" class="inquiryNo" value="${market.inquiryNo}" />
                                                <input type="hidden" class="productNo" value="${market.productNo}" />
                                                <input type="hidden" class="marketCheckFL2" value="${market.marketCheckFl}" />
                                                <input type="hidden" class="marketTitle" value="${market.inquiryTitle}" />
                                                <input type="hidden" class="marketContent" value="${market.inquiryContent}" />
                                                <input type="hidden" class="marketIt2" value="${market.inquiryType}" />
                                            </c:forEach> 

									


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