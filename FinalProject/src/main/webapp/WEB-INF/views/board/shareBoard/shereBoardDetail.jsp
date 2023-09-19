<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴공유게시판</title>
<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 
<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/shareBoard/shareBoardDetail-style.css">
</head>
<body>
     <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>루틴 공유 게시판</h1></div>
        </div>
        <div id="board-area">
            <div>
                <div class="boardImg thumbnail">
                     <img src="${board.imageList[0].imagePath}${board.imageList[0].imageReName}">
                    <%-- <img src="/resources/images/main/log01.png" class = "img"> --%>
                </div>

                 <%-- 썸네일을 제외하고 나머지 이미지의 시작인덱스 번호 지정 --%>
                <c:if test="${board.imageList[0].imageLevel == 0}" >
                    <c:set var="start" value="1"/>
                </c:if>




                <h2 id="title">${board.boardTitle}</h2>
                <hr>
                <div id="board-info">
                    <span>by.${board.memberNickname}</span> | <span>${board.boardCreateDate}</span> | <span>조회수 ${board.readCount}</span>
                </div>
                <div class="boardContent">
                   ${board.boardContent}
                </div>

                <c:forEach var="i" begin="${start}" end="${fn:length(board.imageList)-1}">

                    <div class="routine-area">
                        <h1>${board.imageList[i].imageLevel + 1}.</h1>
                        <div class= "img-area">
                            <c:set var="path" value="${board.imageList[i].imagePath}${board.imageList[i].imageReName}"/>
                           
                            <img src="${path}" class="img">
                        </div>
                        <div class="routine-info">
                            <div class="routineNm">
                                <span>${board.routineList[i - 1].rtTitle} </span>
                                <button type="button" class="boardAddListBtn">Do IT!</button>
                            </div>
                            <div class="routine-content">
                            ${board.routineList[i -1].rtContent}
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
            </div>
            <div id="todolist-area">
                <div id="member-area">
                    <div>
                        <div id="profile-area">
                            <c:choose>
                                <c:when test="${empty board.profileImage}">
                                    <img src="/resources/images/user.png">
                                </c:when>
                                <c:otherwise>
                                    <img src="${board.profile}">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <span>${board.memberNickname}</span>
                        <button>follow</button>
                    </div>
                    <div><span>팔로우 390</span><span> 팔로잉 390</span></div>
                </div>

                <div class="detaile-todolist-area">

                    <h2>My To Do List</h2>
                    <div class="progress">
						<div class="progress-num" ></div>
					</div>
                    <div class="check-area">
					
                        <%-- <div>
                            <input type="checkbox" id="ck1" class="none checkbox">
                            <label for="ck1" class="ck"></label>
                            <span>1. 득근전수 50회 4세트</span>
                            <button type="button"><i class="fa-solid fa-minus minus" style="color: #ffffff;"></i></button>
                        </div> --%>
                        
                       
					
				    </div>  
                    <div>
                       <input type="text" name="addList" class="addList" placeholder="예) 스쿼트 20회 5세트"><button type="button" class="addListBtn"><i class="fa-solid fa-plus" style="color: #ffffff;"></i></button>
                    </div>
                    <div class="tdl-btnArea">
                        <a class="button btnPush btnLightBlue">저장하기</a>
                        <a class="button btnPush btnLightBlue">되돌리기</a>
                    </div>
                
                </div>
            </div>
        </div>
        <!-- 게시글 버튼 영역 -->
        <div class="board-like">
            <c:if test="${empty likeCheck}" >
                <div class="like-cnt" id="like-cnt">
                    <i class="like-btn fa-solid fa-heart fa-2x"></i>
                </div>
            </c:if>

            <c:if test="${!empty likeCheck}" >
                <div class="like-cnt" id="like-cnt" style="background-color: #99E1ED">
                    <i class="like-btn fa-solid fa-heart fa-2x"></i>
                </div>
            </c:if>
        </div>

        <div class="likeCount">${board.likeCount}</div>

        <div id="btn-area">
            <div>
                <button id="goToListBtn">목록으로</button>
                
                <button id="updateBtn">수정하기</button>
                <button id="deleteBtn">삭제하기</button>
            </div>
        </div>


       
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
    </section>

    <%-- <div class="TodoList-modal">
        <div class="model-todolist-area">

            <h2>My To Do List</h2>
            <hr>
            <div class="check-area">
                <div>
                    <input type="checkbox" id="modelck1" class="none">
                    <label for="modelck1" class="ck"></label>
                    <span>득근전수 50회 4세트</span>
                </div>
                
                <div>
                    <input type="checkbox" id="modelck2" class="none">
                    <label for="modelck2" class="ck"></label>
                    <span>득근전수 50회 4세트</span>
                </div>
                <div>
                    <input type="checkbox" id="modelck3" class="none">
                    <label for="modelck3" class="ck"></label>
                    <span>득근전수 50회 4세트</span>
                </div>
                
                
                <div>
                    <input type="checkbox" id="modelck4" class="none">
                    <label for="modelck4" class="ck"></label>
                    <span>득근전수 50회 4세트</span>
                </div>
                
                
                
            </div>
            <div>
                <input type="text" name="addList"><button><i class="fa-solid fa-plus" style="color: #ffffff;"></i></button>
            </div>
            <div class="tdl-btnArea save">
                <a class="button btnPush btnLightBlue ">저장하기</a>
            </div>
            <span>&times</span>
        </div> 
    
    </div>--%>


    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <script>

        const boardNo = "${board.boardNo}";
        const boardMemberNo = "${board.memberNo}";
        const loginMemberNo = "${loginMember.memberNo}";

    </script>


	<script src="/resources/js/board/shareBoard/shareBoardDetail.js"></script>
	<script src="/resources/js/board/comment.js"></script>

</body>
</html>