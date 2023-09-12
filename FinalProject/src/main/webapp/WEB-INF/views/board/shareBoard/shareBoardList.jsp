<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/freeBoard/freeBoardList-style.css">
</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>운동 공유 게시판</h1></div>
            <div>득근전수 회원들과 나만의 운동 루틴을 공유해 보세요.</div>
        </div>
        <div id="search-area">
            <div class="search-place">
                <input type="search" id="market-search" placeholder="search...">
                <button id="search-button"><i class="fas fa-search"></i></button>
            </div>
            <div class="hashTag-area">
                <div>
                    #스쿼트 
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #벤치프레스
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #레그프레스
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
            
            <%-- 광고 영역 --%>
            <div id="ad"></div>
        </div>

        <div class="write-btn-area">
            <button type="button" id="writeBtn">글쓰기</button>
        </div>

        <%-- 페이지네이션 --%>
        <div class="pagination-area">

            <ul class="pagination">

                <!-- 첫 페이지로 이동 -->
                <li><a href="/board/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>


                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                    <c:choose>
                        <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>

                        </c:otherwise>
                    </c:choose>

                </c:forEach>

                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

            </ul>

        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="/resources/js/shareBoard/shareBoardList"></script>
</body>
</html>