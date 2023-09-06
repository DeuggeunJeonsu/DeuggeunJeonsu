<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myOneOnOneInquiry-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myOneOnOneInquiry-style.css">
    
</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 마이페이지 사이드바 include -->
        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

        <div id="right-content-area">
            <div id="title-area">
                <div><h1>1:1 문의</h1></div>
                <div>작성하신 1:1 문의글 목록 및 상세 조회를 할 수 있습니다.</div>
            </div>

            <div id="main-content-area">

                <div>
                    <table id="inquiry-list">
                        <thead class="theadColor">
                            <tr>
                                <th>게시글 번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>답변 상태</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>10</td>
                                <td>근육이 안 생겨요</td>
                                <td>2023.01.09</td>
                                <td>답변 대기 중</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>근육이 안 생겨요</td>
                                <td>2023.01.09</td>
                                <td class="answer">답변 완료</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>