<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%--boardWrite-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/reviewDetail-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">

                <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
                <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
                <link rel="icon" href="/resources/images/favicon_io/favicon.ico" type="image/x-icon">

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section class="main-con">

                <div class="top">
                    <img src="/resources/images/market/test2-main.jpeg" alt="">
                </div>
                <hr>
                <div class="middle">
                    <div id="reviewProfileImage">
                        <img id="contentProfileImg" src="/resources/images/user2.png">
                    </div>

                    <div class="nickname">유저일이지롱</div>
                    <div>2023.09.05</div>
                </div>
                <hr>
                <div class="bottom">
                    맛도 좋고 소화가 잘 되는 프로틴 파우더를 찾고 있었는데, 이번에 산 프로틴이 밸런스가

                    딱 맞네요ㅎㅎㅎㅎ 아침 운동 후 섭취 하고 있는데 살도 빠짐요 ㅋㅋ 맛있는데 살 빠짐;;;;

                    그리고 제티 맛 너무 달아~~~ㅠㅠㅠ 댕꿀맛 다 먹으면 또 사러 올께요 그럼 20000
                </div>
                <!-- 버튼 영역-->
                <div class="btn-area">
                    
                    <!-- 로그인한 회원과 게시글 작성자 번호가 같은 경우-->
                    <!-- <c:if test="${loginMember.memberNo == board.memberNo}"> -->
                        <!-- </c:if> -->
                        <button id="updateBtn">수정</button>
                        <button id="deleteBtn">삭제</button>
                        
                        
                        <button id="goToListBtn">목록으로</button>
                    </div>
                </section>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/board/boardWrite.js"></script>
            <script src="/resources/js/main.js"></script>
        </body>

        </html>