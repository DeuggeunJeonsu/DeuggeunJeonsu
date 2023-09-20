<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- map에서 꺼내기 --%>
<c:set var="member" value="${map.feedMember}"/>
<c:set var="followerTotalCount" value="${map.followerTotalCount}"/>
<c:set var="followingTotalCount" value="${map.followingTotalCount}"/>
<c:set var="followCheck" value="${map.followCheck}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 피드</title>

<%-- memberFeed-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/member/myPage/memberFeed-style.css">

<link rel="stylesheet" href="css/animations.css">

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

</head>
<body">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 회원 정보 영역 -->
        <div id="member-info-area">
            <div class="memberProfileArea">
                <c:if test="${empty member.profileImage}" >
                    <img src="/resources/images/user.png">
                </c:if>
                <c:if test="${!empty member.profileImage}" >
                    <img src="${member.profileImage}">
                </c:if>
            </div>

            <div class="memberInfoArea">

                <div>
                    <div>
                        ${member.memberNickname}
                    </div>

                    <div class="followStateBtn">

                        <%-- 로그인 회원이 피드 주인을 팔로우 X --%>
                        <c:if test="${followCheck == 0}" >
                            <button class="customBtn unfollowBtn" onclick="followBtnClick()"><div>follow</div></button>
                        </c:if>

                        <%-- 로그인 회원이 피드 주인을 팔로우 O --%>
                        <c:if test="${followCheck == 1}" >
                            <button class="customBtn followingBtn" onclick="unfollowBtnClick()"><div>following</div></button>
                        </c:if>

                    </div>
                </div>

                <div>
                    <div class="followInfoArea followerListBtn"  onclick="toggleFollowList(), selectFollowerList()">
                        <div>팔로워</div>
                        <div>${followerTotalCount}</div>
                    </div>
                    <div class="followInfoArea followingListBtn"  onclick="toggleFollowList(), selectFollowingList()">
                        <div>팔로잉</div>
                        <div>${followingTotalCount}</div>
                    </div>
                </div>

            </div>

            <%-- 득근 캘린더 --%>
            <div id="CalendarArea">
                <table class="Calendar">
                    <thead>
                        <tr>
                            <td onClick="prevCalendar();" class="calenderBtn">&#60;</td>
                            <td colspan="5">
                                <span id="calYear"></span>년
                                <span id="calMonth"></span>월
                            </td>
                            <td onClick="nextCalendar();" class="calenderBtn">&#62;</td>
                        </tr>
                        <tr>
                            <td>일</td>
                            <td>월</td>
                            <td>화</td>
                            <td>수</td>
                            <td>목</td>
                            <td>금</td>
                            <td>토</td>
                        </tr>
                    </thead>
        
                    <tbody>
                    </tbody>
                </table>
                <i class="fa-solid fa-caret-up triangle"></i>
                <i class="fa-solid fa-circle Circle"></i>
            </div>
        </div>

        <%-- 득근 캘린더 말풍선 --%>
        <div class="ballon floating">
            ${member.memberNickname} 님의 득근 캘린더를 확인해 보세요! 🎽👟
        </div>

        <%-- 피드 주인의 팔로우 리스트 --%>
        <div class="follow-list-area" id="followListArea" style="display:none;">

            <%-- <c:if test="${!empty followingList}">

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
                    </div>

                </c:forEach>

            </c:if> --%>

        </div>

        <!-- 획득한 뱃지 영역 -->        
        <div id="member-badge-area">

            <div>획득한 뱃지</div>

            <div id="badge-area-middle">
                <div class="prev-btn"><i class="fa-solid fa-circle-chevron-left fa-2x" style="color: #99e1ed;"></i></div>

                <div class="container">
                    <div class="carousel">
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (2).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (3).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (4).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (5).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (6).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (7).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (1).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (2).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (3).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (4).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (5).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (6).png">
                        </div>
                        <div class="badgeImg">
                            <img src="/resources/images/badge/badge (7).png">
                        </div>
                    </div>
                </div>

                <div class="next-btn"><i class="fa-solid fa-circle-chevron-right fa-2x" style="color: #99e1ed;"></i></div>
            </div>

        </div>

        <!-- 작성한 게시글 목록 조회 영역 -->
        <div id="member-board-area">

            <div>작성한 게시글</div>

            <div id="board-area-middle">

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- 페이지네이션 영역 -->
        <div id="pagination-area">
            페이지네이션
        </div>

	</section>

    <script>
        const memberNo = "${member.memberNo}";
        const loginMemberNo = "${loginMember.memberNo}"
    </script>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- memberFeed.js 연결 -->
	<script src="/resources/js/member/myPage/memberFeed.js"></script>


</body>
</html>