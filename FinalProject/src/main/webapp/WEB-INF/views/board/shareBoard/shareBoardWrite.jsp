<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴공유게시판</title>

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/shareBoard/shareBoardWrite-style.css">

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">루틴 공유 게시판  |  글쓰기</div>
              <div>득근전수 회원님들과 공유하고 싶은 운동 루틴을 만들어보세요.</div>
        </div>
        <form action="/board2/2/insert" method="POST"
             class="board-write" id="boardWriteFrm" enctype="multipart/form-data">
            <div class="top-write">
                <div id="writer">
                    <div id="profile-area">
                        <c:if test="${empty loginMember.profileImage}">
                            <img src="/resources/images/user.png">
                        </c:if>
                        <c:if test="${!empty loginMember.profileImage}">
                            <img src="${loginMember.profileImage}">
                        </c:if>


                    </div>
                    <span>${loginMember.memberNickname}</span>
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
                                    <img class="preview" src="/resources/images/boardDetaile/noneImage.png">
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
                                <input type="hidden" class="routineType" name="tagContent" value=""/>
                            </article>
                        </div>
                        <textarea placeholder="루틴 설명을 입력해주세요" name="boardContent"></textarea>
                    </div>
                </div>
                <div class="routine-area">
                    <div>
                        <h3>Routine</h3>
                        <hr>
                    </div>
                    <%-- 득근 캘린더 말풍선 --%>
                    <div class="ballon floating">
                        드래그를 통해 Routine 순서를 바꿀 수 있어요!👟
                    </div>
                    <ul class="routine-add">
                        <li class="routine" draggable="true">
                            <div class="boardImg">
                                <label for="img1">
                                    <img class="preview" src="/resources/images/boardDetaile/noneImage.png">
                                </label>
                                <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                            <div class="routine-write-area">
                                <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName" autocomplete="off" class="routineName">
                                <textarea name="routineContent">1.&#10;2.&#10;3.&#10;&#10;꿀팁!</textarea>
                            </div>
                           <div class="autoSearchArea">
                                <!-- <div class="autoSearch">
                                    <ul id="todo-resultArea">
                                        <li class="todo-result-row" data-id="1">
                                            <span><mark>스쿼</mark>트<span>
                                        </li>
                                        <li class="todo-result-row" data-id="2">
                                            <span><mark>스쿼</mark>트<span>
                                        </li>
                                        <li class="todo-result-row" data-id="3">
                                            <span><mark>스쿼</mark>트<span> | <span class="category">하체</span>
                                        </li>
                                    </ul>
                                </div> -->
                                
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