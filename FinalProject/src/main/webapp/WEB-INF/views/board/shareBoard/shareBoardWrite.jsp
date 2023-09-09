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
                    <input type="text" name="boardTitle" placeholder="제목을 입력해주세요" value="">
                </div>
                <div class="thumbnail-routineType-area">
                    <div class="thumbnail-area">
                        <h3>Thumbnail</h3>
                        <div class="thumbnail-box">
                            <div class="boardImg thumbnail">
                                <label for="img0">
                                    <img class="preview" src="">
                                </label>
                                <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                        </div>
                    </div>
                    <div class="routineType-area">
                        <div>
                            <h3>Routine Type</h3>
                            <article class="cont-select">
                                <button class="btn-select" type="button">운동타입</button>
                                <ul class="list-member">
                                    <li><button type="button">하체</button></li>
                                    <li><button type="button">상체</button></li>
                                    <li><button type="button">등</button></li>
                                    <li><button type="button">어깨</button></li>
                                    <li><button type="button">팔</button></li>
                                </ul>
                            </article>
                        </div>
                        <textarea placeholder="루틴 설명을 입력해주세요" name="content"></textarea>
                    </div>
                </div>
                <div class="routine-area">
                    <div>
                        <h3>Routine</h3>
                        <hr>
                    </div>
                    
                    <ul class="routine-add">
                        <li class="routine" draggale="true">
                            <div class="boardImg">
                                <label for="img1">
                                    <img class="preview" src="">
                                </label>
                                <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                            <div class="routine-write-area">
                                <input type="test" placeholder="예) 스쿼트 20회 30세트" name="routineName">
<textarea name="routineContent">
1. 
2. 
3. 

꿀팁!
</textarea>
                            </div>
                            <div class="routine-cancle"><button type="button" class="cancle">&times;</button></div>
                        </li>



                    </ul>
                </div>
                <div class="routine-add-btn-area">
                    <button id="routineBtn" type="button">
                        Routine 
                        <i class="fa-solid fa-circle-plus"></i>
                    </button>
                
                </div>
            </div>

        </form>    

    </section>


    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="/resources/js/board/shareBoard/shareBoardWrite.js"></script>

</body>
</html>