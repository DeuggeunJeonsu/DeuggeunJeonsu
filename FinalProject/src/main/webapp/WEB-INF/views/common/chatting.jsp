<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>득근채팅</title>
    <link rel="stylesheet" href="/resources/css/common/chatting-style.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        const loginMemberNo = "${loginMember.memberNo}"; // 로그인한 회원 번호
    </script>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
</head>

<body>
    <main>

        <jsp:include page="../common/header.jsp"></jsp:include>

        <section id="mainContainer">
            <div id="titleArea">
                <div><h1>득근채팅</h1></div>
                <div>득근전수 회원님들이 1:1로 소통할 수 있는 공간입니다.</div>
            </div>

            <div id="chattingContainer">
                <div id="menus">
                    <button id="menuBtn" class="menu-btn"><i class="fa-solid fa-bars fa-2xl" style="color: #ffffff;"></i></button>
                    <button id="addTarget" class="menu-btn"><i class="fa-solid fa-user-plus fa-2xl" style="color: #ffffff;"></i></button>
                    <button id="palette" class="menu-btn"><i class="fa-solid fa-palette fa-2xl" style="color: #ffffff;"></i></button>
                    <button id="chatting" class="menu-btn"><i class="fa-solid fa-message fa-2xl" style="color: #222;"></i></button>
                </div>
                <div id="chattingRoomListArea">
                    <!-- 채팅방 맴버찾기 -->
                    <div id="addTargetPopupLayer" class="popup-layer-close">  
                        <div class="target-input-area">
                            <input type="search" id="targetInput" placeholder="닉네임 또는 아이디를 입력하세요" autocomplete="off">
                            <span id="addTargetCloseBtn" class="closeBtn">&times</span>
                        </div>
            
                        <ul id="resultArea">
                            <li class="result-row" data-id="1">
                                <img class="result-row-img" src="/resources/images/user.png">
                                <span> <mark>유저</mark>일</span>
                            </li>
                            <li class="result-row"  data-id="2">
                                <img class="result-row-img" src="/resources/images/user.png"> 
                                <span><mark>유저</mark>이</span>
                            </li>
                            <li class="result-row" data-id="3">
                                <img class="result-row-img" src="/resources/images/user.png">
                                <span> <mark>유저</mark>삼</span>
                            </li>
                            <li class="result-row"  data-id="4">
                                <img class="result-row-img" src="/resources/images/user.png"> 
                                <span><mark>유저</mark>사</span>
                            </li>
            
                            <!-- <li class="result-row">일치하는 회원이 없습니다</li> -->
                        </ul>
                    </div>

                    <!-- 팔레트 -->
                    <div id="palettePopupLayer" class="popup-layer-close"> 
                        <div class="palette-title-area">
                            <p>원하는 색상으로 테마를 변경해보세요!</p>
                            <span id="paletteCloseBtn" class="closeBtn">&times</span>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">palette 1</div>
                            <div class="thema-color-area">
                                <input type="text" class="hex-color-input" value="#99E1ED" id="palette1HexColor">
                                <input type="text" class="rgb-color-input" value="(153,225,237)" id="palette1RGBColor">
                                <div class="palette-preview" id="Preview1"></div>
                            </div>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">palette 2</div>
                            <div class="thema-color-area">
                                <input type="text" class="hex-color-input" value="#F5F5F5" id="palette2HexColor">
                                <input type="text" class="rgb-color-input" value="(245,245,245)" id="palette2RGBColor">
                                <div class="palette-preview" id="Preview2"></div>
                            </div>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">palette 3</div>
                            <div class="thema-color-area">
                                <input type="text" class="hex-color-input" value="#FFFFFF" id="palette3HexColor">
                                <input type="text" class="rgb-color-input" value="(255,255,255)" id="palette3RGBColor">
                                <div class="palette-preview" id="Preview3"></div>
                            </div>
                        </div>
                        <div id="saveThemaBtnArea">
                            <button id="saveThemaBtn">테마 저장</button>
                        </div>
                    </div>
                    
                    <!-- 채팅방 검색 -->
                    <div id="roomSearchArea">
                        <i class="fa fa-solid fa-magnifying-glass fa-2xl" style="color: #ddd;"></i>
                        <input type="text" id="roomSearchInput">
                    </div>

                    <!-- 채팅방 목록 -->
                    <ul id="chattingRoomList">

                        <li class="chatting-item select" chat-no="${room.chattingNo}" target-no="${room.targetNo}">
                            <div class="item-header">
                                <img class="list-profile" src="/resources/images/user.png">
                            </div>
                            <div class="item-body">
                                <p>
                                    <span class="target-name">상대유저</span>
                                    <span class="recent-send-time">05:01</span>
                                </p>
                                <div>
                                    <p class="recent-message">내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅</p>
                                    <c:if test="${room.notReadCount > 0}">
                                        <p class="not-read-count">${room.notReadCount}</p>
                                    </c:if>
                                </div>
                            </div>
                        </li>

                        <li class="chatting-item" chat-no="${room.chattingNo}" target-no="${room.targetNo}">
                            <div class="item-header">
                                <img class="list-profile" src="/resources/images/user.png">
                            </div>
                            <div class="item-body">
                                <p>
                                    <span class="target-name">상대유저2</span>
                                    <span class="recent-send-time">06:25</span>
                                </p>
                                <div>
                                    <p class="recent-message">상대유저가 보낸 채팅</p>
                                    <p class="not-read-count">2</p>
                                </div>
                            </div>
                        </li>

                    </ul>

                </div>
                <div id="chattingRoomDetail">
                    <!-- 채팅방 이름 -->
                    <div id="roomTitleArea">
                        <div id="roomTitle">채팅방 이름</div>
                    </div>

                    <!-- 채팅내역 -->
                    <div id="chattingArea">
                        <ul class="display-chatting">

                            <li class="my-chat">
                                <span class="chatDate">04:28</span>
                                <p class="chat">내가보낸 채팅</p>
                            </li>

                            <li class="target-chat">
                                <img src="/resources/images/user.png">
                                <div>
                                    <b>상대유저</b><br>
                                    <p class="chat">상대유저가 보낸 채팅</p>
                                    <span class="chatDate">04:30</span>
                                </div>
                            </li>
                            <li class="my-chat">
                                <span class="chatDate">04:31</span>
                                <p class="chat">내가보낸 채팅</p>
                            </li>

                            <li class="target-chat">
                                <img src="/resources/images/user.png">
                                <div>
                                    <b>상대유저</b><br>
                                    <p class="chat">상대유저가 보낸 채팅</p>
                                    <span class="chatDate">04:32</span>
                                </div>
                            </li>

                            <li class="my-chat">
                                <span class="chatDate"></span>
                                <p class="chat">내가보낸 채팅</p>
                            </li>
                            </li>
                            <li class="my-chat">
                                <span class="chatDate"></span>
                                <p class="chat">내가보낸 채팅</p>
                            </li>
                            <li class="my-chat">
                                <span class="chatDate">04:48</span>
                                <p class="chat">내가보낸 채팅</p>
                            </li>

                            <li class="target-chat">
                                <img src="/resources/images/user.png">
                                <div>
                                    <b>상대유저</b><br>
                                    <p class="chat">상대유저가 보낸 채팅</p>
                                    <span class="chatDate"></span>
                                </div>
                            </li>
                            <li class="target-chat">
                                <img src="/resources/images/user.png">
                                <div>
                                    <b>상대유저</b><br>
                                    <p class="chat">상대유저가 보낸 채팅</p>
                                    <span class="chatDate">04:57</span>
                                </div>
                            </li>

                            <li class="my-chat">
                                <span class="chatDate">05:43</span>
                                <p class="chat">내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅 내가보낸 채팅</p>
                            </li>
                        </ul>
                    </div>
                    <!-- 채팅 입력, 전송 -->
                    <div id="sendArea">
                        <div class="send-btn-area">
                            <button id="addImgBtn" class="sendBtns"><i class="fa-regular fa-image fa-2xl" style="color: #ffffff;"></i></button>
                        </div>
                        <textarea id="inputChatting" rows="1"></textarea>
                        <div class="send-btn-area">
                            <button id="sendBtn" class="sendBtns"><i class="fa-solid fa-paper-plane fa-2xl" style="color: #ffffff;"></i></button>
                        </div>
                    </div>
                </div>
            </div>

        </section>

    </main>
</body>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="/resources/js/chatting.js"></script>
    
</html>