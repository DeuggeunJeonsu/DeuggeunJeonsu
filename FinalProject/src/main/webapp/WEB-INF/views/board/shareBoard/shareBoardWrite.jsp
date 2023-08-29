<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/shareBoard/shareBoardWrite-style.css">
</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>운동 공유 게시판 글쓰기</h1></div>
              <div>득근전수 회원님들과 공유하고 싶은 운동 루틴을 만들어보세요.</div>
        </div>
        <form action="/board2/${boardCode}/insert" method="POST" class="board-write" id="boardWriteFrm">
            <div class="top-write">
                <div id="writer">
                    <div id="profile-area">
                        <img src="../resources/images/user.png">
                    </div>
                    <span>닉네임</span>
                </div>
                <button type="submit" id="writebtn">작성완료</button>
            </div>
            <div class= "middle-write">
                <div class="writeTitle-area">
                    <input type="text" name="boardTitle" placeholder="제목" value="">
                </div>
                <div class="thumbnail-Routine-area">
                    <div class="thumbnail-area">
                        <h3>thumbnail<h3>
                        <div class="img-box">
                            <div class="boardImg thumbnail">
                                <label for="img0">
                                    <img class="preview" src="">
                                </label>
                                <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                        </div>
                    </div>
                    <div class="routine-area">
                        <div>
                            <h3>Routine Type</h3>
                           <select name='exercise-name'>
                                <option value='' selected>-- 선택 --</option>
                                <option value='apple'>사과</option>
                                <option value='banana'>바나나</option>
                                <option value='lemon'>레몬</option>
                            </select>
                        </div>
                        <textarea></textarea>
                    </div>
                </div>
            </div>

        </form>    
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>