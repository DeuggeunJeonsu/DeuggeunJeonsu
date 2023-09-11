<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>
<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 
<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/shareBoard/shareBoardDetail-style.css">
</head>
<body>
     <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>운동 공유 게시판</h1></div>
        </div>
        <div id="board-area">
            <div>
                <div class="boardImg thumbnail">
                    
                    <img src="/resources/images/main/log01.png" class = "img">
                </div>
                <h2 id="title">야 너도 할 수 있어! 하체!</h2>
                <hr>
                <div id="board-info">
                    <span>by.닉네임</span> | <span>2023-08-21</span> | <span>조회수 100</span>
                </div>
                <div class="boardContent">
                    천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살
                    천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살
                </div>
                <div class="routine-area">
                    <h1>1.</h1>
                    <div class= "img-area">
                        <img src="../../../../resources/images/badge/badge (1).png" class="img">
                    </div>
                    <div class="routine-info">
                        <div class="routineNm">
                            <span>스쿼트 </span>
                            <button type="button" class="boardAddListBtn">Do IT!</button>
                        </div>
                        <div class="routine-content">
                        1. 스쿼트 동작은 이러쿵 저러쿵<br>
                        2. 스쿼트 동작은 이러쿵 저러쿵<br>
                        3. 스쿼트 동작은 이러쿵 저러쿵<br>
                        <br>
                        꿀팁! 오늘은 피자 먹을 거다!
                        </div>
                    </div>
                </div>
                <div class="routine-area">
                    <h1>2.</h1>
                    <div class= "img-area">
                        <img src="../../../../resources/images/badge/badge (1).png" class="img">
                    </div>
                    <div class="routine-info">
                        <div class="routineNm">
                            <span>스쿼트 </span>
                           <button type="button" class="boardAddListBtn">Do IT!</button>
                        </div>
                        <div class="routine-content">
                        1. 스쿼트 동작은 이러쿵 저러쿵<br>
                        2. 스쿼트 동작은 이러쿵 저러쿵<br>
                        3. 스쿼트 동작은 이러쿵 저러쿵<br>
                        <br>
                        꿀팁! 오늘은 피자 먹을 거다!
                        </div>
                    </div>
                </div>
                <div class="routine-area">
                    <h1>3.</h1>
                    <div class= "img-area">
                        <img src="../../../../resources/images/badge/badge (1).png" class="img">
                    </div>
                    <div class="routine-info">
                        <div class="routineNm">
                            <span>스쿼트 </span>
                            <button type="button" class="boardAddListBtn">Do IT!</button>
                        </div>
                        <div class="routine-content">
                        1. 스쿼트 동작은 이러쿵 저러쿵<br>
                        2. 스쿼트 동작은 이러쿵 저러쿵<br>
                        3. 스쿼트 동작은 이러쿵 저러쿵<br>
                        <br>
                        꿀팁! 오늘은 피자 먹을 거다!
                        </div>
                    </div>
                </div>
                <div class="routine-area">
                    <h1>4.</h1>
                    <div class= "img-area">
                        <img src="../../../../resources/images/badge/badge (1).png" class="img">
                    </div>
                    <div class="routine-info">
                        <div class="routineNm">
                            <span>스쿼트 </span>
                          <button type="button" class="boardAddListBtn">Do IT!</button>
                        </div>
                        <div class="routine-content">
                        1. 스쿼트 동작은 이러쿵 저러쿵<br>
                        2. 스쿼트 동작은 이러쿵 저러쿵<br>
                        3. 스쿼트 동작은 이러쿵 저러쿵<br>
                        <br>
                        꿀팁! 오늘은 피자 먹을 거다!
                        </div>
                    </div>
                </div>
            </div>
            <div id="todolist-area">
                <div id="member-area">
                    <div>
                        <div id="profile-area">
                            <img src="../resources/images/user.png">
                        </div>
                        <span>닉네임</span>
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
					
                        <div>
                            <input type="checkbox" id="ck1" class="none checkbox">
                            <label for="ck1" class="ck"></label>
                            <span>1. 득근전수 50회 4세트</span>
                            <button type="button"><i class="fa-solid fa-minus minus" style="color: #ffffff;"></i></button>
                        </div>
                        
                        <div>
                            <input type="checkbox" id="ck2" class="none checkbox">
                            <label for="ck2" class="ck"></label>
                            <span>2. 득근전수 50회 4세트</span>
                            <button type="button"><i class="fa-solid fa-minus minus" style="color: #ffffff;"></i></button>
                        </div>
                        <div>
                            <input type="checkbox" id="ck3" class="none checkbox">
                            <label for="ck3" class="ck"></label>
                            <span>3. 득근전수 50회 4세트</span>
                            <button type="button"><i class="fa-solid fa-minus minus" style="color: #ffffff;"></i></button>
                        </div>
                        
                        
                        <div>
                            <input type="checkbox" id="ck4" class="none checkbox">
                            <label for="ck4" class="ck"></label>
                            <span>4. 득근전수 50회 4세트</span>
                            <button type="button"><i class="fa-solid fa-minus minus" style="color: #ffffff;"></i></button>
                        </div>
					
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
    
	<script src="/resources/js/board/shareBoard/shareBoardDetail.js"></script>
	<script src="/resources/js/TodoList/todoList.js"></script>
	<script src="/resources/js/board/comment.js"></script>

</body>
</html>