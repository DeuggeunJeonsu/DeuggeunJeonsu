<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팔로잉/팔로워</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myBadge-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/followingFollower-style.css">

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
                <div><h1>팔로잉/팔로워</h1></div>
                <div>회원님의 팔로잉/팔로워 목록을 확인할 수 있습니다.</div>
            </div>

            <div id="main-content-area">
                <div id="follow-list-btn-area">
                    <div class="followListBtn listBtnClick">
                        <div>팔로잉</div>
                        <div>99</div>
                    </div>
                    <div class="followListBtn">
                        <div>팔로워</div>
                        <div>100</div>
                    </div>
                </div>

                <div id="follow-list-area">

                    <div class="follow-list">
                        <a href="/myPage/memberFeed">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="/myPage/memberFeed">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                    <div class="follow-list">
                        <a href="#">
                            <div class="followProfileImg">
                                <img src="../../../../resources/images/user.png">
                            </div>
                        </a>
                        <a href="#">
                            <div class="followNickname">
                                닉네임
                            </div>
                        </a>
                        <div class="followStateBtn">
                            <button class="customBtn followingBtn"><div>following</div></button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- followingFollower.js 연결 -->
	<script src="../resources/js/member/myPage/followingFollower.js"></script>

</body>
</html>