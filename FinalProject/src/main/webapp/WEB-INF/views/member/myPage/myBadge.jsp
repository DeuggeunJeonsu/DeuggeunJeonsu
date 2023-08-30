<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 뱃지</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myBadge-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myBadge-style.css">
    
</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 마이페이지 사이드바 include -->
        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

        <div id="right-content-area">
            <div id="title-area">
                <div><h1>내 뱃지</h1></div>
                <div>회원님의 뱃지 획득 상태를 확인하세요!</div>
            </div>

            <div id="main-content-area">
                <div>득근왕이 되는 그날까지!</div>

                <div id="badge-area">

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge">
                        <div class="badgeImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            시작이 반이다
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>첫 투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                </div>

                <div id="badge-count-area">
                    <div>
                        <div>
                            <div class="badgeCount">6</div>
                            <div>보유 뱃지 수</div>
                        </div>
                        <div>
                            🏋🏃‍♀️💪<br>
                            <a href="#">다른 뱃지도 획득하러 가 볼까요?</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>