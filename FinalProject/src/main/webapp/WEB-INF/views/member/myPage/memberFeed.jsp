<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- map에서 꺼내기 --%>
<c:set var="member" value="${map.feedMember}"/>
<c:set var="followerTotalCount" value="${map.followerTotalCount}"/>
<c:set var="followingTotalCount" value="${map.followingTotalCount}"/>
<c:set var="followCheck" value="${map.followCheck}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 피드</title>

<%-- memberFeed-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/member/myPage/memberFeed-style.css">

<%-- 팔로우 버튼 애니메이션 css 연결 --%>
<%-- <link rel="stylesheet" href="css/animations.css"> --%>

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

</head>
<body>
    
    <script>
        const memberNo = "${member.memberNo}";
        const loginMemberNo = "${loginMember.memberNo}"
    </script>

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
                        <div><span>팔로워</span></div>
                        <div>${followerTotalCount}</div>
                    </div>
                    <div class="followInfoArea followingListBtn"  onclick="toggleFollowList(), selectFollowingList()">
                        <div><span>팔로잉</span></div>
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

                <c:if test="${!empty boardList}">

                    <c:forEach items="${boardList}" var="board">

                        <div class="thumbnail">

                            <a href="/board/${board.boardCode}/${board.boardNo}">
                                <div>
                                    <c:if test="${empty board.thumbnail}" >
                                        <img src="/resources/images/main/log02.png" id="default-logo">
                                    </c:if>

                                    <c:if test="${!empty board.thumbnail}">
                                        <img src="${board.thumbnail}">
                                    </c:if>
                                </div>

                                <div>
                                    <div class="title">${board.boardTitle}</div>
                                    <div class="createDate-area">
                                        <div>작성일 ${board.boardCreateDate}</div>
                                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i>&nbsp;${board.commentCount}</div>
                                    </div>

                                    <div class="profile-area">
                                        <div class="profileArea">
                                            <c:if test="${empty board.profileImage}" >
                                                <img src="/resources/images/user.png">
                                            </c:if>

                                            <c:if test="${!empty board.profileImage}" >
                                                <img src="${board.profileImage}">
                                            </c:if>
                                        </div>
                                        <div>${board.memberNickname}</div>
                                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i>&nbsp;${board.likeCount}</div>
                                    </div>
                                </div>
                            </a>

                        </div>

                    </c:forEach>

                </c:if>

                
                <c:if test="${empty boardList}">
                    <h3 class="textCenter">${member.memberNickname} 님이 아직 게시글을 작성하지 않았습니다. 😪</h3>
                </c:if>


            </div>

        </div>

        <div class="pagination-area">
            
            <ul class="pagination">

                <!-- 첫 페이지로 이동 -->
                <li><a href="/myPage/memberFeed/${memberNo}?cp=1">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/myPage/memberFeed/${memberNo}?cp=${pagination.prevPage}">&lt;</a></li>


                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                    <c:choose>
                        <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/myPage/memberFeed/${memberNo}?cp=${i}">${i}</a></li>

                        </c:otherwise>
                    </c:choose>

                </c:forEach>

                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/myPage/memberFeed/${memberNo}?cp=${pagination.nextPage}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/myPage/memberFeed/${memberNo}?cp=${pagination.maxPage}">&gt;&gt;</a></li>

            </ul>
            
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- memberFeed.js 연결 -->
	<script src="/resources/js/member/myPage/memberFeed.js"></script>

    <script>
        function test(imageName) {
            LoadingWithMask('/resources/images/myPage/loading.');
            setTimeout("closeLoadingWithMask()", 3000);
        }
        
        function LoadingWithMask(gif) {
            //화면의 높이와 너비를 구합니다.
            var maskHeight = $(document).height();
            var maskWidth  = window.document.body.clientWidth;
            
            //화면에 출력할 마스크를 설정해줍니다.
            var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
            var loadingImg = '';
            
            loadingImg += " <img src='"+ gif + "' style='position: absolute; display: block; margin: 0px auto;'/>";
        
            //화면에 레이어 추가
            $('body')
                .append(mask)
        
            //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
            $('#mask').css({
                    'width' : maskWidth,
                    'height': maskHeight,
                    'opacity' : '0.3'
            }); 
        
            //마스크 표시
            $('#mask').show();
        
            //로딩중 이미지 표시
            $('#loadingImg').append(loadingImg);
            $('#loadingImg').show();
        }
        
        function closeLoadingWithMask() {
            $('#mask, #loadingImg').hide();
            $('#mask, #loadingImg').empty();  
        }
</script>


</body>
</html>