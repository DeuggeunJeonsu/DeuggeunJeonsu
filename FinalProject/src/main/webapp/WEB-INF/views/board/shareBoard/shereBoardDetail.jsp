<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/shareBoard/shareBoardDetail-style.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>운동 공유 게시판</h1></div>
        </div>
        <div id="board-area">
            <div>
                <div class="boardImg thumbnail">
                    
                    <img src="/resources/images/main/log01.png">
                </div>
                <h2 id="title">야 너도 할 수 있어! 하체!</h2>
                <hr>
                <div id="board-info">
                    by.<span>닉네임</span>
                    | <span>2023-08-21</span> |
                    조회수<span>100</span>
                </div>
                <div class="routineContent">
                    천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살
                    천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살
                </div>
                <div>

                </div>
            </div>
            <div id="todolist-area"></div>

        </div>
        

    </section>


    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="/resources/js/board/shareBoardWrite.js"></script>

</body>
</html>