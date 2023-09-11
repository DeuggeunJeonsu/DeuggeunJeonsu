<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/freeBoard/freeBoardList-style.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판</h1></div>
            <div>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</div>
        </div>
        <div id="search-area">
            <div class="search-place">
                <input type="search" id="market-search" placeholder="search...">
                <button id="search-button"><i class="fas fa-search"></i></button>
            </div>
            <div class="hashTag-area">
                <div>
                    #오운완
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #OOTD
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #단백질쉐이커
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
            </div>
            <div id="sort-btn-area">
                <a href="#"><span>최신순</span></a> |
                <a href="#"><span>인기순</span></a> |
                <a href="#"><span>팔로워</span></a>
            </div>
        </div>

        <div id="list-area">
            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>작성일 23.01.01</div>
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                    </div>
                    <div class="profile-area">
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
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
                        <div class="profileArea"><img src="../resources/images/user.png"></div>
                        <div>닉네임</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>
            

        </div>

        <div class="write-btn-area">
            <button type="button" id="writeBtn">글쓰기</button>
        </div>

        <div class="paginationArea">
            <div>
                페이지네이션 영역
            </div>
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>