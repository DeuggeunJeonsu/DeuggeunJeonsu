<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%--boardWrite-style.css 연결 --%>
                <link rel="stylesheet" href="/resources/css/board/QnAWrite-style.css">

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

                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-con">
                <form action="/board/4/QnAWrite" method="POST" id="QnAform">
                    <h1 class="title">1:1 문의글 작성</h1>
                    <div>문의해 주신 내용은 영업일 기준 2~3일 내에 답변 드립니다🍀</div>

                    <hr>
                    <br>

                    <div>
                        <input type="text" name="boardTitle" id="QnATitle" placeholder="제목" value="" placeholder="제목을 입력해주세요">
                    </div>

                    <div>
                        <textarea name="boardContent" id="QnAContent" cols="30" rows="10"
                            placeholder="내용을 입력해주세요"></textarea>
                    </div>

                    <br>

                    <div class="bottom">
                        <div>
                            <button id="submit-button">작성</button>
                            <button type="button" id="cancel-button">취소</button>
                        </div>
                    </div>
                </form> 
            </section>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/board/boardWrite.js"></script>
            <script src="/resources/js/main.js"></script>
            <script src="/resources/js/member/myPage/QnAWrite.js"></script>
        </body>

        </html>