<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>건강/운동정보</title>

	<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/board/informationBoard/informationBoardDetail-style.css">
    <%-- GSAP 라이브러리 추가 --%>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 
</head>

<body>
    <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <div id="title-area">
			<div><h1>건강/운동정보</h1></div>
			<div>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</div>
			<div>
				<div><i class="fa-regular fa-clock"></i> <span id="createDate">2023-08-29</span></div>
				<div><i class="fa-solid fa-eye"></i> <span id="readCount">127</span></div>
			</div>
			<div>
				<div class="categorie"># 건강정보</div>
				<div class="title">운동을 시작하는 방법 : 초보자를 위한 가이드</div>
			</div>
		</div>

		<div id="content-area">
			<img src="/resources/images/board/detail1.jpg" alt="이미지첨부1">
			<p>
				1. 건강 상태 체크

				운동을 시작하기 전에 의료전문가와 상담하고 건강과 관련된 검사를 받는 것이 중요하다.<br>

				특히 고강도의 신체활동을 처음 접하는 사람들에게 중요한 부분이고, 조기 검진을 통해 운동 중 부상 위험에 처할 수 있는 건강 문제나 상태를 알 수 있으므로 운동 전 신체의 건강상태를 확인하는 것은 중요하다.<br>

				또한 자신에게 맞는 운동강도를 정하는데 도움이 될 수 있으며, 개인 트레이너와 운동을 시작한다면 트레이너에게 자신의 상태를 전달하여 적합한 운동계획을 세울 수 있다.<br>
			</p>
			<br><br><br><br><br><br>

			<img src="/resources/images/board/detail2.jpg" alt="이미지첨부2">
			<p>
				2. 현실적인 목표와 계획 세우기

				규칙적인 운동을 시작하길로 정했다면 달성 가능한 루틴과 목표를 고려하여 계획을 세우자.<br>

				먼저 현실적으로 도달가능한 목표의 운동강도로 시작하고 점차 체력을 향상시켜 점진적으로 강도를 올릴 수 있도록 한다.<br>

				예를 들어 목표가 5km 달리기를 완주하는 것이라면 입보다 짧ㅂ은 거리를 목표로 시작하고 점차 걸리를 늘려 최종목표에 다를 수 있게 계획을 세우도록 한다.

				달성 가능한 작은 목표부터 시작하면 성공 가능성이 높아지고 운동 시 강한 동기부여를 받을 수 있다.
			</p>
			<br><br><br><br><br><br>

			<img src="/resources/images/board/detail3.jpg" alt="이미지첨부3">
			<p>
				3. 습관화하기

				운동 실천 성공의 또다른 핵심 요소는 운동루틴을 고수하는 것이다.

				운동을 습관화하고 규칙적으로 실천하면 장기적으로 운동습관을 유지하는 것이 더 쉬워진다.

				연구에 따르면 건강에 해로운 행동을 새로운 건강한 습관으로 대체하는 것이 장기적으로 습관을 유지하기 위한 훌륭한 접근법이라는 결과를 나타냈다.

				매일 같은 시간에 일정을 짜거나 운동을 하는 것은 일과를 유지하고 지속할 수 있는 좋은 방법이며, 퇴근 직후나 아침에 운동을 실천하는 것을 계획함으로써 운동을 습관화 할 수 있다.

				이처럼 습관화를 위해서 운동을 실천할 수 있는 가장 적합한 시간을 선택하는것 또한 중요하다.
			</p>
			<br><br><br><br><br><br>
		</div>

        <!-- 좋아요 영역 -->
        <div class="board-like">
            <div class="like-cnt unchecked" id="like-cnt">
                <i class="like-btn fa-solid fa-heart fa-2x"></i>
            </div>
        </div>

        <div class="likeCount">99</div>

        <!-- 버튼 영역 -->
		<div class="detail-btn-area">
			<div>
				<button id="goToListBtn">목록으로</button>
			</div>

			<div class="btn-area">
				<button id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
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

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardDetail.js"></script>
	
</body>

</html>