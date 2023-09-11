<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>득근채팅</title>
    <link rel="stylesheet" href="/resources/css/common/chatting-style.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        const loginMemberNo = "${loginMember.memberNo}"; // 로그인한 회원 번호
    </script>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
</head>

<body>
    <main>

        <jsp:include page="../common/header.jsp"></jsp:include>

        <section id="mainContainer">
            <div id="titleArea">
                <div><h1>득근채팅</h1></div>
                <div>득근전수 회원님들이 1:1로 소통할 수 있는 공간입니다.</div>
            </div>

            <div id="chattingContainer">
                <div id="settings"></div>
                <div id="chattingRoomList"></div>
                <div id="chattingRoomDetail">
                    <div id="chattingArea"></div>
                    <div id="sendArea">
                        <button id="addImgBtn"><i class="fa-regular fa-image fa-2xl"></i></button>
                        <textarea id="inputChatting"></textarea>
                        <button id="sendBtn"><i class="fa-solid fa-paper-plane fa-2xl"></i></button>
                    </div>
                </div>
            </div>
            

        </section>

    </main>
</body>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="/resources/js/chatting.js"></script>
    
</html>