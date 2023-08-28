<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    
    <!-- jquery연결 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- <link rel="icon" type="image/png" href="favicon.ico"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- main.css 연결 -->
    <link rel="stylesheet" href="/resources/css/main-style.css">
    <!-- 아이콘 사이트 key -->
    <script src="https://kit.fontawesome.com/9e44afcd4a.js" crossorigin="anonymous"></script>

</head>
<body>

    <div class="main-content">
        <nav class="header-nav no-background ">

            <!-- search 영역 -->
            <div class="top-search">
                <div class="search-container">
                    <div class="input-group">
                        <span class="search-icon-area">
                            <i class="fa fa-solid fa-magnifying-glass"></i>
                        </span>
                        <input type="text" class="form-search" placeholder="검색어를 입력해주세요">
                        <span class="search-icon-area close-search">
                            <!-- <i class="fa fa-regular fa-circle-xmark"></i> -->
                            <i>&times;</i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="nav-container">
                <div class="nav-icon">
                    <ul>
                        <li class="basket">
                            <a href="#">
                                <i class="fa fa-solid fa-cart-shopping"></i>
                                <span class="shopping-count">3</span>
                            </a>
                        </li>
                        <li class="search">
                            <a href="#">
                                <i class="fa fa-solid fa-magnifying-glass"></i>
                            </a>
                        </li>
                        <li class="login-icon dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">로그인</a>
                        </li>
                    </ul>
                </div>
                <div class="log-area">
                    <a href="#" class="log-image">
                        <img src="/resources/images/main/log01.png" class="log log-disply  log01" alt="">
                        <img src="/resources/images/main/log02.png" class="log  log02" alt="">
                    </a>
                </div>
                <div class="collapse" id="navbar-menu">
                    <ul class="nav-list" data-in="fadeInDown" data-out="fadeOutUp">
                        <li>
                            <a href="#">건강/운동정보</a>
                        </li>
                        <li>
                            <a href="#">운동/공유 게시판</a>
                        </li>
                        <li>
                            <a href="#">자유 게시판</a>
                        </li>
                        <li>
                            <a href="#">공지사항</a>
                        </li>
                        <li>
                            <a href="#">득근마켓</a>
                        </li>
                    </ul>
                </div>
                
            </div>




        </nav>
        

    </div>


    
    
    <script src="main.js"></script>
</body>
</html>