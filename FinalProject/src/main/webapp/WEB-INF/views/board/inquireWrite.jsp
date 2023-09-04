<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%--boardWrite-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/inquireWrite-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-con">
                <h1 class="title">스토어 문의글 작성</h1>
                <div>문의해 주신 내용은 영업일 기준 2~3일 내에 답변 드립니다🍀</div>
                <hr>
                <br>
                <div class="select">
                    <div class="select-option">
                        <select class="select-box">
                            <option value="option1">-- 문의 유형 --</option>
                            <option value="option1">취소</option>
                            <option value="option2">교환</option> 
                        </select>
                    </div>
                    <input type="text" name="inquireTitle" placeholder="제목" value="" placeholder="제목을 입력해주세요">
                    
                </div>
                <div>
                    <textarea name="reviewContent" id="reviewContent" cols="30" rows="10"
                        placeholder="내용을 입력해주세요"></textarea>
                </div>

                <div class="fileBox previewImage">
                    <input class="uploadFileName" value="파일선택" disabled="disabled" style="width: 300px;">
                    <label for="file1">사진업로드</label>
                    <input type="file" id="file1" class="inputHidden">
                </div>
                <br>
                <div class="bottom">
                    <div>
                        <button id="submit-button">작성</button>
                        <button id="cancel-button">취소</button>
                    </div>
                </div>




            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/board/boardWrite.js"></script>
            <script src="/resources/js/main.js"></script>
        </body>

        </html>