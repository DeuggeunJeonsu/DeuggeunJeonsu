<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>트렌딩 득근 포스트</title>
    <link rel="stylesheet" href="/resources/css/common/main.css">
    <link rel="stylesheet" href="/resources/css/common/trending-post-style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <section id="trending-post-container">
        
        <h2 class="main-article-tit">Trending Deuggeun Post</h2>

        <div id="trending-list-area">

            <div id="wrapper">
                <div id="left-side">
                    <ul>
                        <li class="trending-all active">
                        <div class="icon active">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 640 512">
                                <path d="M353.8 54.1L330.2 6.3c-3.9-8.3-16.1-8.6-20.4 0L286.2 54.1l-52.3 7.5c-9.3 1.4-13.3 12.9-6.4 19.8l38 37-9 52.1c-1.4 9.3 8.2 16.5 16.8 12.2l46.9-24.8 46.6 24.4c8.6 4.3 18.3-2.9 16.8-12.2l-9-52.1 38-36.6c6.8-6.8 2.9-18.3-6.4-19.8l-52.3-7.5zM256 256c-17.7 0-32 14.3-32 32V480c0 17.7 14.3 32 32 32H384c17.7 0 32-14.3 32-32V288c0-17.7-14.3-32-32-32H256zM32 320c-17.7 0-32 14.3-32 32V480c0 17.7 14.3 32 32 32H160c17.7 0 32-14.3 32-32V352c0-17.7-14.3-32-32-32H32zm416 96v64c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32V416c0-17.7-14.3-32-32-32H480c-17.7 0-32 14.3-32 32z"/>
                            </svg>
                        </div>
                        전체 게시글
                        </li>

                        <li class="trending-info">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512">
                                <path d="M417.3 360.1l-71.6-4.8c-5.2-.3-10.3 1.1-14.5 4.2s-7.2 7.4-8.4 12.5l-17.6 69.6C289.5 445.8 273 448 256 448s-33.5-2.2-49.2-6.4L189.2 372c-1.3-5-4.3-9.4-8.4-12.5s-9.3-4.5-14.5-4.2l-71.6 4.8c-17.6-27.2-28.5-59.2-30.4-93.6L125 228.3c4.4-2.8 7.6-7 9.2-11.9s1.4-10.2-.5-15l-26.7-66.6C128 109.2 155.3 89 186.7 76.9l55.2 46c4 3.3 9 5.1 14.1 5.1s10.2-1.8 14.1-5.1l55.2-46c31.3 12.1 58.7 32.3 79.6 57.9l-26.7 66.6c-1.9 4.8-2.1 10.1-.5 15s4.9 9.1 9.2 11.9l60.7 38.2c-1.9 34.4-12.8 66.4-30.4 93.6zM256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm14.1-325.7c-8.4-6.1-19.8-6.1-28.2 0L194 221c-8.4 6.1-11.9 16.9-8.7 26.8l18.3 56.3c3.2 9.9 12.4 16.6 22.8 16.6h59.2c10.4 0 19.6-6.7 22.8-16.6l18.3-56.3c3.2-9.9-.3-20.7-8.7-26.8l-47.9-34.8z"/>
                            </svg>
                        </div>
                        정보 공유
                        </li>

                        <li class="trending-routine">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512">
                                <path d="M4.1 38.2C1.4 34.2 0 29.4 0 24.6C0 11 11 0 24.6 0H133.9c11.2 0 21.7 5.9 27.4 15.5l68.5 114.1c-48.2 6.1-91.3 28.6-123.4 61.9L4.1 38.2zm503.7 0L405.6 191.5c-32.1-33.3-75.2-55.8-123.4-61.9L350.7 15.5C356.5 5.9 366.9 0 378.1 0H487.4C501 0 512 11 512 24.6c0 4.8-1.4 9.6-4.1 13.6zM80 336a176 176 0 1 1 352 0A176 176 0 1 1 80 336zm184.4-94.9c-3.4-7-13.3-7-16.8 0l-22.4 45.4c-1.4 2.8-4 4.7-7 5.1L168 298.9c-7.7 1.1-10.7 10.5-5.2 16l36.3 35.4c2.2 2.2 3.2 5.2 2.7 8.3l-8.6 49.9c-1.3 7.6 6.7 13.5 13.6 9.9l44.8-23.6c2.7-1.4 6-1.4 8.7 0l44.8 23.6c6.9 3.6 14.9-2.2 13.6-9.9l-8.6-49.9c-.5-3 .5-6.1 2.7-8.3l36.3-35.4c5.6-5.4 2.5-14.8-5.2-16l-50.1-7.3c-3-.4-5.7-2.4-7-5.1l-22.4-45.4z"/>
                            </svg>
                        </div>
                        루틴 공유
                        </li>

                        <li class="trending-free">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 640 512">
                                <path d="M96 64c0-17.7 14.3-32 32-32h32c17.7 0 32 14.3 32 32V224v64V448c0 17.7-14.3 32-32 32H128c-17.7 0-32-14.3-32-32V384H64c-17.7 0-32-14.3-32-32V288c-17.7 0-32-14.3-32-32s14.3-32 32-32V160c0-17.7 14.3-32 32-32H96V64zm448 0v64h32c17.7 0 32 14.3 32 32v64c17.7 0 32 14.3 32 32s-14.3 32-32 32v64c0 17.7-14.3 32-32 32H544v64c0 17.7-14.3 32-32 32H480c-17.7 0-32-14.3-32-32V288 224 64c0-17.7 14.3-32 32-32h32c17.7 0 32 14.3 32 32zM416 224v64H224V224H416z"/>
                            </svg>
                        </div>
                        자유 게시판
                        </li>
                    </ul>
                </div>
            
                <div id="border">
                    <div id="line" class="one"></div>
                </div>
            
                <div id="right-side">

                    <div id="first" class="active">
                        <%-- <a href="#">
                            <div class="trending-board-select">
                                <img src="/resources/images/freeBoard/44712837-b1ec-4d8b-8b43-a4ee9337ecf8.jpg" class="trending-img">
                                <div class="trending-writer-info">
                                    <div>
                                        <span>
                                            <i class="fa-regular fa-comment fa-xs" style="color: #99e1ed;"></i> 99
                                        </span>
                                        <span>
                                            <i class="fa-solid fa-heart fa-xs" style="color: #99e1ed;"></i> 99
                                        </span>
                                    </div>
                                    <div>by. 득근이</div>
                                </div>
                                <h1>게시글 제목2</h1>
                                <p>게시글 내용2</p>
                            </div>    
                        </a> --%>
                    </div>

                    <div id="second">
                        <a href="#">
                            <div class="trending-board-select">
                                <img src="/resources/images/freeBoard/44712837-b1ec-4d8b-8b43-a4ee9337ecf8.jpg" class="trending-img">
                                <div class="trending-nickname">by. 득근이</div>
                                <h1>게시글 제목2</h1>
                                <p>게시글 내용2</p>
                            </div>    
                        </a>
                    </div>

                    <div id="third">
                        <a href="#">
                            <div class="trending-board-select">
                                <img src="/resources/images/freeBoard/44712837-b1ec-4d8b-8b43-a4ee9337ecf8.jpg" class="trending-img">
                                <div class="trending-nickname">by. 득근이</div>
                                <h1>게시글 제목2</h1>
                                <p>게시글 내용2</p>
                            </div>    
                        </a>
                    </div>

                    <div id="fourth">
                        <a href="#">
                            <div class="trending-board-select">
                                <img src="/resources/images/freeBoard/44712837-b1ec-4d8b-8b43-a4ee9337ecf8.jpg" class="trending-img">
                                <div class="trending-nickname">by. 득근이</div>
                                <h1>게시글 제목2</h1>
                                <p>게시글 내용2</p>
                            </div>    
                        </a>
                    </div>
                </div>
            </div>
  
        </div>

    </section>

    <!-- trendingPost.js 연결 -->
    <script src="/resources/js/trendingPost.js"></script>
</body>
</html>
