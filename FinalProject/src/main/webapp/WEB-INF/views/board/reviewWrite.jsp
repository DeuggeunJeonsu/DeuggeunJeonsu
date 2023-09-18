<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%--boardWrite-style.css 연결 --%>
                <link rel="stylesheet" href="/resources/css/board/reviewWrite-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">

                <!-- SweetAlert2 CSS 파일 추가 -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

                <!-- SweetAlert2 JavaScript 파일 추가 -->
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
                
                <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
                <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
                <link rel="icon" href="/resources/images/favicon_io/favicon.ico" type="image/x-icon">

<%--            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>


        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

                <form action="/board/${boardCode}/review/${productNo}/insert" method="POST" id="reviewForm" enctype="multipart/form-data">
                    <section id="main-con">

                            <h1 class="title">리뷰 작성</h1>
                            <div>구매하신 상품에 대한 리뷰를 작성하여 득근전수 회원님들에게 공유해 보세요🍀</div>
                            <hr>
                            <br>
                            <div>
                                <input type="text" name="reviewTitle" id="reviewTitle" placeholder="제목" value="" maxlength="10"
                                    placeholder="제목을 입력해주세요">
                            </div>
                            <div>
                                <textarea name="reviewContent" id="reviewContent" cols="30" rows="10"
                                    placeholder="내용을 입력해주세요"></textarea>
                            </div>

                            <div class="fileBox previewImage">
                                <input class="uploadFileName" value="파일선택" disabled="disabled" style="width: 300px;">
                                <label for="file1">사진업로드</label>
                                <input type="file" name="reviewImage" id="file1" class="inputHidden">
                            </div>
                            <br>
                            <div class="bottom">
                                <div>
                                    <button type="submit" id="submit-button" onclick="showAlert()">작성</button>
                                    <button id="cancel-button">취소</button>
                                </div>
                            </div>
                    </section>
                </form>


            <script src="/resources/js/market/reviewWrite.js"></script>

            <script>
                const loginMember = "${loginMember}";
            </script>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </body>

        </html>