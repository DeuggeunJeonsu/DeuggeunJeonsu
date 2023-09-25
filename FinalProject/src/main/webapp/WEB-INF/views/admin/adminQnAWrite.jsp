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
                <%-- <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
                <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
                <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
                <link rel="icon" href="/resources/images/favicon_io/favicon.ico" type="image/x-icon"> --%>

                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-con">
                <form action="/admin/QnAWrite" method="POST" id="QnAform" class="formTag">
                    <h1 class="title">1:1 문의글 답변</h1>
                    <div>회원님의 문제가 원활히 해결 될 수 있도록 정성껏 답변 부탁드립니다🍀</div>

                    <hr>
                    <br>

                    <div>
                        <input type="text" name="boardTitle" id="QnATitle" class="boardTitle" placeholder="제목" value="" placeholder="제목을 입력해주세요">
                    </div>

                    <div>
                        <textarea name="boardContent" id="QnAContent" class="boardContent" cols="30" rows="10"
                            placeholder="내용을 입력해주세요"></textarea>
                    </div>

                    <br>

                    <div class="bottom">
                        <div>
                            <button id="submit-button" onclick="return submitBtn()">작성</button>
                            <input type="hidden" name="boardNo" value="${boardNo}" />
                </form> 
                            <button type='button' id="cancel-button" >취소</button>
                        </div>
                    </div>
            </section>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


        </body>

        <script src="/resources/js/board/admin/adminInquiryWrite.js"></script>

        </html>