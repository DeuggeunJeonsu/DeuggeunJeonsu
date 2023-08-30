<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 피드</title>

<%-- memberFeed-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/member/myPage/memberFeed-style.css">
</head>
<body">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 회원 정보 영역 -->
        <div id="member-info-area">
            <div class="memberProfileArea">
                <img src="../../../../resources/images/user.png">
            </div>

            <div class="memberInfoArea">

                <div>
                    <div>
                        닉네임
                    </div>
                    <div class="followBtnArea">
                        <button>following</button>
                    </div>
                </div>

                <div>
                    <div class="followInfoArea followerArea">
                        <div>팔로워</div>
                        <div>340</div>
                    </div>
                    <div class="followInfoArea followingArea">
                        <div>팔로잉</div>
                        <div>290</div>
                    </div>
                </div>

            </div>

        </div>

        <!-- 획득한 뱃지 영역 -->        
        <div id="member-badge-area">

            <div>획득한 뱃지</div>

            <div id="badge-area-middle">
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (1).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (2).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (3).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (4).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (5).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (6).png">
                </div>
                <div class="badgeImg">
                    <img src="../../../../resources/images/badge/badge (7).png">
                </div>
            </div>

        </div>

        <!-- 작성한 게시글 목록 조회 영역 -->
        <div id="member-board-area">

            <div>작성한 게시글</div>

            <div id="board-area-middle">

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </div>

                <div class="thumbnail">
                    <div><img src="../../../../resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="../../../../resources/images/user.png"></div>
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

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>