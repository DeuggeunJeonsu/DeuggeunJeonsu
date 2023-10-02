<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

    <title>득근채팅</title>

    <link rel="stylesheet" href="/resources/css/common/chatting-style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.css"/>
    <script src="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.js"></script>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <script>
        const loginMember = "${loginMember}"; // 로그인한 회원
        const loginMemberNo = "${loginMember.memberNo}"; // 로그인한 회원 번호
        let memberThema = "${loginMember.memberThema}"; // 회원 테마
        let themas = memberThema.split(",,");
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
                    <div id="buttons">
                        <button id="menuBtn" class="menu-btn"><i class="fa-solid fa-bars fa-2xl"></i></button>
                        <button id="palette" class="menu-btn"><i class="fa-solid fa-palette fa-xl"></i></button>
                        <button id="addTarget" class="menu-btn"><i class="fa-solid fa-user-plus fa-xl"></i></button>
                    </div>
                </div>
                <div id="chattingRoomListArea">
                    <!-- 채팅방 맴버찾기 -->
                    <div id="addTargetPopupLayer" class="displayNone">  
                        <div class="target-input-area">
                            <input type="search" id="targetInput" placeholder="닉네임 또는 아이디를 입력하세요" autocomplete="off">
                            <span id="addTargetCloseBtn" class="closeBtn">&times</span>
                        </div>
            
                        <ul id="resultArea">
                            <!-- <li class="result-row">검색된 회원목록</li> -->
                        </ul>
                    </div>

                    <!-- 팔레트 -->
                    <div id="palettePopupLayer" class="displayNone"> 
                        <div class="palette-title-area">
                            <p>원하는 색상으로 테마를 변경해보세요!</p>
                            <span id="paletteCloseBtn" class="closeBtn">&times</span>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">사이드 메뉴</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="palette1Color" data-coloris>
                            </div>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">메뉴 아이콘</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="menuIconColor" data-coloris>
                            </div>
                        </div>

                        <div class="thema-input-area">
                            <div class="paletteName">채팅방 목록</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="palette2Color" data-coloris>
                            </div>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">목록 텍스트</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="listFontColor" data-coloris>
                            </div>
                        </div>

                        <div class="thema-input-area">
                            <div class="paletteName">채팅방 내부</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="palette3Color" data-coloris>
                            </div>
                        </div>
                        <div class="thema-input-area">
                            <div class="paletteName">내부 텍스트</div>
                            <div class="thema-color-area">
                                <input type="text" class="color-input" id="chatFontColor" data-coloris>
                            </div>
                        </div>

                        <div id="saveThemaBtnArea">
                            <button id="saveThemaBtn">테마 저장</button>
                        </div>

                    </div>
                    
                    <!-- 채팅방 검색 -->
                    <div id="roomSearchArea">
                        <i class="fa fa-solid fa-magnifying-glass fa-2xl" style="color: #ddd;"></i>
                        <input type="text" id="roomSearchInput" placeholder="채팅방 목록 내 검색" autocomplete="off">
                    </div>

                    <!-- 채팅방 목록 -->
                    <ul id="chattingRoomList">
                        <c:forEach var="room" items="${roomList}">
                            <li class="chatting-item" chat-no="${room.chattingNo}" target-no="${room.targetNo}">
                                <div class="item-header">
                                    <c:if test="${not empty room.targetProfile}">
                                        <img class="list-profile" src="${room.targetProfile}">
                                    </c:if>
                                    <c:if test="${empty room.targetProfile}">
                                        <img class="list-profile" src="/resources/images/user.png">
                                    </c:if>
                                </div>
                                <div class="item-body">
                                    <p>
                                        <span class="target-name">${room.targetNickName}</span>
                                        <span class="recent-send-time">${room.sendTime}</span>
                                    </p>
                                    <div>
                                        <p class="recent-message">${room.lastMessage}</p>
                                        <c:if test="${room.notReadCount > 0}">
                                            <p class="not-read-count">${room.notReadCount}</p>
                                        </c:if>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>

                </div>
                <div id="chattingRoomDetail">
                    <!-- 채팅방 이름 -->
                    <div id="roomTitleArea">
                        <div id="roomTitle"></div>
                    </div>

                    <!-- 채팅내역 -->
                    <div id="chattingArea">
                        <ul class="display-chatting">
                            <!-- <li class="my-chat">
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
                            </li>-->
                        </ul>
                    </div>
                    <!-- 채팅 입력, 전송 -->
                    <div id="sendArea">
                        <!-- <div class="send-btn-area">
                            <button id="addImgBtn" class="sendBtns"><i class="fa-regular fa-image fa-2xl"></i></button>
                        </div> -->
                        <textarea id="inputChatting" rows="1" style="overflow:hidden"></textarea>
                        <div class="send-btn-area">
                            <button id="sendBtn" class="sendBtns"><i class="fa-solid fa-paper-plane fa-2xl"></i></button>
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