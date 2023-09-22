<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹</title>
    
    <!-- jquery연결 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- <link rel="icon" type="image/png" href="favicon.ico"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- 아이콘 사이트 key -->
    <script src="https://kit.fontawesome.com/9e44afcd4a.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/ranking-style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
</head>
<body>

    <section class="ranking-section">
        <div class="ranking-container">

            <div class="ranking-title-area">
                <div>
                    <h1>RANKING</h1>
                </div>
            </div>

            <div class="ranking-content-area">
                <div class="ranking-table-area"> <!--홈페이지 출석-->
                    <div class="ranking-table" id="attendanceRanking">
                        <div class="my-rank-area">
                            <p>30</p>
                            <p>rank : 1</p>
                        </div>
                        <div class="you">You</div>

                        <div class="ranking-title">
                            출석 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top2.png">
                                <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                <div class="top3-info-area top2-font">
                                    <div>2ed NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top1.png">
                                <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                <div class="top3-info-area top1-font">
                                    <div>1st NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top3.png">
                                <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                <div class="top3-info-area top3-font">
                                    <div>3rd NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                        </div>
                        <div class="ranking-row">
                            <div>4</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>5</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>6</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>7</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>8</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                    </div>
                </div>

                <div class="ranking-table-area"> <!--투두리스트 실천-->
                    <div class="ranking-table" id="executionRanking">
                        <div class="my-rank-area">
                            <p>30</p>
                            <p>rank : 1</p>
                        </div>
                        <div class="you">You</div>

                        <div class="ranking-title">
                            실천 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top2.png">
                                <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                <div class="top3-info-area top2-font">
                                    <div>2ed NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top1.png">
                                <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                <div class="top3-info-area top1-font">
                                    <div>1st NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top3.png">
                                <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                <div class="top3-info-area top3-font">
                                    <div>3rd NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                        </div>
                        <div class="ranking-row">
                            <div>4</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>5</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>6</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>7</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>8</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                    </div>
                </div>

                <div class="ranking-table-area"> <!--커뮤니티 활동-->
                    <div class="ranking-table" id="communityRanking">
                        <div class="my-rank-area">
                            <p>12308</p>
                            <p>rank : 1</p>
                        </div>
                        <div class="you">You</div>
                        
                        <div class="ranking-title">
                            활동 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top2.png">
                                <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                <div class="top3-info-area top2-font">
                                    <div>2ed NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top1.png">
                                <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                <div class="top3-info-area top1-font">
                                    <div>1st NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                            <div>
                                <img class="top3-border-img" src="/resources/images/ranking/top3.png">
                                <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                <div class="top3-info-area top3-font">
                                    <div>3rd NickName</div>
                                    <div>Score icon</div>
                                </div>
                            </div>
                        </div>
                        <div class="ranking-row">
                            <div>4</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>5</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>6</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>7</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>8</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                    </div>
                </div>

                
            </div>
            
        </div>
    </section>

</body>
</html>