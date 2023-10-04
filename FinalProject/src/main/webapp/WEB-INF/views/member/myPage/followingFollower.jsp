<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에서 꺼내기 --%>
<c:set var="followingList" value="${map.followingList}"/>
<c:set var="followingTotalCount" value="${map.followingTotalCount}"/>
<c:set var="followerTotalCount" value="${map.followerTotalCount}"/>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팔로잉/팔로워</title>

<%-- myPageSideBar-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">

<%-- followingFollower-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/member/myPage/followingFollower-style.css">

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    
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
                    <div class="followingListBtn followListBtn listBtnClick" onclick='selectFollowingList()'>
                        <div>팔로잉</div>
                        <div id="following-count-area">${followingTotalCount}</div>
                    </div>
                    <div class="followerListBtn followListBtn" onclick='selectFollowerList()'>
                        <div>팔로워</div>
                        <div id="follower-count-area">${followerTotalCount}</div>
                    </div>
                </div>

                <div id="follow-list-area">

                    <c:if test="${!empty followingList}" >
                        <c:forEach items="${followingList}" var="following">

                            <div class="follow-list">

                                <a href="/myPage/memberFeed/${following.memberNo}">
                                    <c:if test="${empty following.profileImage}" >
                                        <div class="followProfileImg">
                                            <img src="/resources/images/user.png">
                                        </div>
                                    </c:if>
                                    <c:if test="${!empty following.profileImage}" >
                                        <div class="followProfileImg">
                                            <img src="${following.profileImage}">
                                        </div>
                                    </c:if>
                                </a>

                                <a href="/myPage/memberFeed/${following.memberNo}">
                                    <div class="followNickname">
                                        ${following.memberNickname}
                                    </div>
                                </a>

                                <div class="followStateBtn">
                                    <button class="customBtn followingBtn" onclick="unfollowBtnClick(${following.memberNo})"><div>following</div></button>
                                </div>

                            </div>

                        </c:forEach>

                    </c:if>

                </div>

            </div>
        </div>

	</section>

    <script>
        const memberNo = "${loginMember.memberNo}";
    </script>

    <!-- followingFollower.js 연결 -->
	<script src="/resources/js/member/myPage/followingFollower.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>