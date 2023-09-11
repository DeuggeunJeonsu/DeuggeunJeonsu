<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 게시글</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myBadge-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myBoardList-style.css">
    
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
                <div><h1>내 게시글</h1></div>
                <div>회원님이 작성하신 게시글을 조회할 수 있습니다.</div>
            </div>

            <div id="main-content-area">
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
                </div>
                <!-- 페이지네이션 영역 -->
                <div id="pagination-area">
                    페이지네이션
                </div>
            </div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>