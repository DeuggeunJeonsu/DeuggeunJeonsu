<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- marketList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/market/marketList-style.css">

<!-- Font Awesome CDN 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H" crossorigin="anonymous">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">득근 마켓</div>
            <div><h3>건강한 삶을 지향하는 득근전수 회원님들을 위한 마켓입니다 :)</h3></div>
        </div>
        <div id="search-area">
            <div class="search-place">
                <input type="search" id="market-search" placeholder="search...">
                <button id="search-button"><i class="fas fa-search"></i></button>
                
            </div>
            <div id="sort-btn-area">
                <a href="#"><span>최신순</span></a> |
                <a href="#"><span>인기순</span></a>
            </div>
        </div>
        
        <div id="list-area" class="font-weight">
            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>
            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>

            <div class="thumbnail">
                <div> <a href="/marketDetail">
                    <img src="/resources/images/main/log02.png">
                </a>
                </div>
                <div class="list-content">
                    <div class="title"><a href="">상품명입니다</a></div>
                    <div>내용 영역</div>
                </div>
            </div>   
        </section>
        <div class="page">
            페이지네이션 영역
        </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script src="/resources/js/main.js"></script>
</body>
</html>