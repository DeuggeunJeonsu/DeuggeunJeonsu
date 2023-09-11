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

<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 

<%-- freeBoardDetail-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/freeBoard/freeBoardDetail-style.css">
</head>
<body>

    <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판</h1></div>
            <div>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</div>
        </div>

        <div id="detail-container">

            <!-- 게시글 제목 -->
            <div id="title-middle-area">
                <div id="title">제목입니다.</div>
                <div>
                    <div id="writing-date">작성일 23.01.01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> | <div id="readCount">조회수 999</div>
                </div>
            </div>

            <!-- 게시글 작성자 정보 -->
            <div id="writer-info-area">

                <div id="profile-area">
                    <img src="../../../../resources/images/user.png">
                </div>

                <div id="nick-area">
                    
                    <div id="nickname"><a href="#">닉네임</a></div>
                    <div>
                        <button id="following-btn">
                            <i class="fa-solid fa-circle-check whiteChk" style="color: #ffffff;"></i>    
                            <i class="fa-solid fa-circle-check blueChk" style="color: #99e1ed; display: none"></i>
                            following
                        </button>
                        <button id="follow-btn" style="display: none">
                            <i class="fa-solid fa-circle-plus whiteChk2" style="color: #ffffff; display: none"></i>
                            <i class="fa-solid fa-circle-plus blueChk2" style="color: #99e1ed;"></i>
                            follow
                        </button>
                    </div>
                </div>

            </div>
    
            <!-- 게시글 해시태그 영역 -->
            <div id="hashtag-area">

                <a href="#">
                    <div class="hashtag">#오운완</div>
                </a>
                <a href="#">
                    <div class="hashtag">#OOTD</div>
                </a>
                <a href="#">
                    <div class="hashtag">#운동폼미쳤다</div>
                </a>

            </div>
    
            <!-- 게시글 상세 조회 내용 영역 -->
            <div id="board-detail-area">

                <div id="board-content-area">
                    <div>
                        <img src="../../../../resources/images/market/bono.png">
                    </div>
                    
                    <pre>
안녕하세요
오늘 가입했습니다
잘 부탁드려용
                    </pre>
                </div>
    
                <!-- 게시글 버튼 영역 -->
                <div class="board-like">
                    <div class="like-cnt unchecked" id="like-cnt">
                        <i class="like-btn fa-solid fa-heart fa-2x"></i>
                    </div>
                </div>

                <div class="likeCount">99</div>

                <div id="btn-area">
                    <div>
                        <button>목록으로</button>
                        
                        <button>수정하기</button>
                        <button>삭제하기</button>
                    </div>
                </div>

            </div>
    
            <!-- 댓글 영역 -->
            <div id="comment-area">

                <div class="comment-count-area">
                    <i class="fa-regular fa-comment" ></i> <span>댓글 4</span>
                </div>

                <div class="comment-input">
                    <textarea placeholder="댓글을 입력해주세요"></textarea>
                    <button><img src="/resources/images/icon/send-icon.png"></button>
                </div>

                <ul id="commentList">
                    <li class="comment-row">
                        <p class="comment-writer">
                            <img src="/resources/images/user.png">
                            <span>닉네임</span>
                        </p>
                        <p class="comment-content">부모 댓글 내용입니다</p>
                        <div>
                            <div>
                                <span class="comment-date">2023-09-02</span>
                                <span>&times</span>
                            </div>
                            <span>
                                <button>수정</button>
                                <button>답글</button>
                            </span>
                        </div>
                    </li>

                    <li class="comment-row child-comment">
                        <p class="comment-writer">
                            <img src="/resources/images/user.png">
                            <span>닉네임</span>
                        </p>
                        <p class="comment-content">자식 댓글 내용입니다</p>
                        <div>
                            <div>
                                <span class="comment-date">2023-09-02</span>
                                <span>&times</span>
                            </div>
                            <span>
                                <button>수정</button>
                            </span>
                        </div>
                    </li>

                    <li class="comment-row child-comment">
                        <p class="comment-writer">
                            <img src="/resources/images/user.png">
                            <span>닉네임</span>
                        </p>
                        <p class="comment-content">자식 댓글 내용입니다</p>
                        <div>
                            <div>
                                <span class="comment-date">2023-09-02</span>
                                <span>&times</span>
                            </div>
                            <span>
                                <button>수정</button>
                            </span>
                        </div>
                    </li>

                    <li class="comment-row">
                        <p class="comment-writer">
                            <img src="/resources/images/user.png">
                            <span>닉네임</span>
                        </p>
    
                        <p class="comment-content">부모 댓글 내용입니다</p>
                        
                        <div>
                            <div>
                                <span class="comment-date">2023-09-02</span>
                                <span>&times</span>
                            </div>
                            <span>
                                <button>수정</button>
                                <button>답글</button>
                            </span>
                        </div>
                    </li>

                </ul>

            </div>

        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- freeBoardDetail.js 연결 -->
	<script src="../resources/js/board/freeBoard/freeBoardDetail.js"></script>

</body>
</html>

