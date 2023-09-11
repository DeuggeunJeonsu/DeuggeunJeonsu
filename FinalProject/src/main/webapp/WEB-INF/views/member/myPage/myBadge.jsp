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
    
    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

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
                            <img src="../../../../resources/images/badge/badge (9).png">
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
                            <img src="../../../../resources/images/badge/badge (2).png">
                        </div>
                        <div class="badgeTitle">
                            초심자의 행운
                        </div>
                        <div class="badgeContent">
                            투두리스트를<br>누적 7일 달성했어요
                        </div>
                        <div class="badgeDate">
                            23.01.01 획득
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (3).png">
                        </div>
                        <div class="badgeTitle">
                            성실 끝판왕
                        </div>
                        <div class="badgeContent">
                            10일 연속<br>투두리스트를 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeTitle">
                            맨날 운동하고십오
                        </div>
                        <div class="badgeContent">
                            투두리스트를<br>누적 15일 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (8).png">
                        </div>
                        <div class="badgeTitle">
                            득근 중독
                        </div>
                        <div class="badgeContent">
                            투두리스트를<br>누적 30일 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (6).png">
                        </div>
                        <div class="badgeTitle">
                            운동은 템빨
                        </div>
                        <div class="badgeContent">
                            득근마켓에서<br>첫 구매를 했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (7).png">
                        </div>
                        <div class="badgeTitle">
                            득근 인플루언서
                        </div>
                        <div class="badgeContent">
                            팔로워 수<br>100명을 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (4).png">
                        </div>
                        <div class="badgeTitle">
                            진정한 득근왕
                        </div>
                        <div class="badgeContent">
                            투두리스트를<br>누적 50일 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                    <div class="badge notAchieved">
                        <div class="badgeImg notAchievedImg">
                            <img src="../../../../resources/images/badge/badge (5).png">
                        </div>
                        <div class="badgeTitle">
                            레전드 득근왕
                        </div>
                        <div class="badgeContent">
                            득근전수에서<br>누적 100일을 달성했어요
                        </div>
                        <div class="badgeDate">
                            미획득
                        </div>
                        <div class="lock">
                            <i class="fa-solid fa-lock fa-5x" style="color: #fff;"></i>
                        </div>
                    </div>

                </div>

                <div id="badge-count-area">
                    <div>
                        <div>
                            <div class="badgeCount">2</div>
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

</body>
</html>