<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상품 리뷰 상세페이지</title>

    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

    <%-- inquiryDetail-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/market/inquiryDetail-style.css">
</head>

<body>

<%-- mojs 라이브러리 추가 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section id="main-container">
<%--    <div id="title-area">--%>
<%--        <div>--%>
<%--            <h1>상품 문의</h1>--%>
<%--        </div>--%>
<%--        <div>득근마켓에서 궁금한점이 있으시다면 언제든 문의해주세요😆</div>--%>
<%--    </div>--%>

    <div id="detail-container">

        <!-- 게시글 제목 -->
        <div id="title-middle-area">
            <div id="title">${inquiry.inquiryTitle}</div>
            <br>
            <br>
            <div class="rightCon">
                <div id="writing-date">작성일&nbsp;&nbsp;${inquiry.inquiryCreateDate}</div>
            </div>
        </div>

        <!-- 게시글 작성자 정보 -->
        <div id="writer-info-area">

            <div id="profile-area">
                <c:choose>
                    <%-- 프로필 사진이 없는 경우--%>
                    <c:when test="${empty inquiry.profileImage}">
                        <img src="/resources/images/user.png">
                    </c:when>
                <%-- 프로필 사진이 있는 경우 --%>
                    <c:otherwise>
                        <img src="${inquiry.profileImage}">
                    </c:otherwise>
                </c:choose>
            </div>

            <div id="nick-area">
                <div id="nickname"><a href="#">${inquiry.memberNickname}</a></div>
            </div>
        </div>
    <hr>
        <br>
        <!-- 게시글 상세 조회 내용 영역 -->
        <div id="board-detail-area">
            <div id="board-content-area">
                <c:if test="${!empty inquiry.uploadImage}">
                    <div class="uploadImg-area">
                        <img src="${inquiry.uploadImage}" alt="Uploaded image">
                    </div>
                </c:if>

                <div class="content-area">
                    <div class="content">${inquiry.inquiryContent}</div>
                </div>
            </div>
            <br>
            <div id="btn-area">
                <div>
                    <button id="goToListBtn">목록으로</button>

<%--                    <c:if test="${loginMember.memberNo == review.memberNo}">--%>
                        <div>
                            <a href="/board/update/${inquiryNo}">
                                <button id="updateBtn">수정하기</button>
                            </a>
                            <button id="deleteBtn">삭제하기</button>
                        </div>
<%--                    </c:if>--%>
                </div>
            </div>
        </div>
    </div>
</section>

<br>
<br>
<!-- footer include -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
    const productNo = "${inquiry.productNo}";
    const inquiryNo = "${inquiry.inquiryNo}";
    const loginMemberNo = "${loginMember.memberNo}";
</script>
<script src="/resources/js/market/inquiryDetail.js"></script>

</body>

</html>