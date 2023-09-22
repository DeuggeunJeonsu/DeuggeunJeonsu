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

    <%-- reviewDetail-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/market/reviewDetail-style.css">
</head>

<body>

<%-- mojs 라이브러리 추가 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section id="main-container">
<%--    <div id="title-area">--%>
<%--        <div>--%>
<%--            <h1>상품 리뷰</h1>--%>
<%--        </div>--%>
<%--        <div>득근전수 회원님들이 자유롭게 상품 후기를 나누는 공간입니다 🥰</div>--%>
<%--    </div>--%>
<%--    <hr>--%>
    <div id="detail-container">

        <!-- 게시글 제목 -->
        <div id="title-middle-area">
            <div id="title">${review.reviewTitle}</div>
            <div class="rightCon">
                <div id="writing-date">작성일&nbsp;&nbsp;${review.reviewCreateDate}&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                |<div id="readCount">조회수&nbsp;&nbsp;${review.count}</div>
            </div>
        </div>

<hr>
        <br>
        <!-- 게시글 작성자 정보 -->
        <div id="writer-info-area">

            <div id="profile-area">
                <img src="/resources/images/user.png">
            </div>

            <div id="nick-area">
                <div id="nickname"><a href="#">${review.memberNickname}</a></div>
            </div>

        </div>
        <!-- 게시글 상세 조회 내용 영역 -->
        <div id="board-detail-area">

<%--            <div id="board-content-area">--%>
<%--                <div class="uploadImg">--%>
<%--                    <c:if test="${!empty review.uploadImage}">--%>
<%--                        <img src="${review.uploadImage}" alt="">--%>
<%--                    </c:if>--%>
<%--                </div>--%>
<%--&lt;%&ndash;                <c:if test="${!empty review.uploadImage}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--                <div class="content">${review.reviewContent}</div>--%>
<%--            </div>--%>
            <div id="board-content-area">

                <c:if test="${!empty review.uploadImage}">
                    <div class="uploadImg">
                        <img src="${review.uploadImage}" alt="">
                    </div>
                </c:if>

                <div class="content">${review.reviewContent}</div>
            </div>

            <div id="btn-area">
                <div>
                    <button id="goToListBtn">목록으로</button>

                    <c:if test="${loginMember.memberNo == review.memberNo}">
                        <div>
                            <a href="/board/${reviewNo}/update">
                                <button id="updateBtn">수정하기</button>
                            </a>
                                <button id="deleteBtn">삭제하기</button>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>

    </div>

</section>
<div class="place"></div>

<!-- footer include -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
    const productNo = "${review.productNo}";
    const reviewNo = "${review.reviewNo}";
    const loginMemberNo = "${loginMember.memberNo}";
</script>
<!-- boardWrite.js 연결 -->
<script src="/resources/js/board/boardWrite.js"></script>

</body>

</html>