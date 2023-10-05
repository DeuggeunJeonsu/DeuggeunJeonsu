<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소개페이지</title>
    <style>
        /* Panels. */
.splitview {
    position: relative;
    width: 100%;
    min-height: 45vw;
    overflow: hidden;
}

.panel {
    position: absolute;
    width: 100vw;
    min-height: 45vw;
    overflow: hidden;
}

    .panel .content {
        position: absolute;
        width: 100vw;
        min-height: 45vw;
        color: #FFF;
    }

    .panel .description {
        width: 25%;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        text-align: center;
    }

    .panel img {
        box-shadow: 0 0 20px 20px rgba(0, 0, 0, 0.15);
        width: 35%;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }


    .bottom {
        background-color: rgb(44, 44, 44);
        z-index: 0.5;
    }

        .bottom .description {
            right: 5%;
        }

    .top {
        background-color: #99e1ed;
        z-index: 0.7;
        width: 50vw;

        /*-webkit-clip-path: polygon(60% 0, 100% 0, 100% 100%, 40% 100%);
        clip-path: polygon(60% 0, 100% 0, 100% 100%, 40% 100%);*/
    }

    .top .description {
        left: 5%;
    }

    /* Handle. */
    .handle {
        height: 100%;
        position: absolute;
        display: block;
        background-color: #fff;
        width: 5px;
        top: 0;
        left: 50%;
        z-index: 0.5;
    }

    /* Skewed. */
    .skewed .handle {
        top: 50%;
        transform: rotate(30deg) translateY(-50%);
        height: 200%;
        -webkit-transform-origin: top;
        -moz-transform-origin: top;
        transform-origin: top;
    }

    .skewed .top {
        transform: skew(-30deg);
        margin-left: -1000px;
        width: calc(50vw + 1000px);
    }

    .skewed .top .content {
        transform: skew(30deg);
        margin-left: 1000px;
    }
    .pre1, .pre2{
        line-height: 24px;
    }
    .pre1{
        
        font-weight: bold;
    }


    </style>

</head>
<body>
    
    <div class="splitview skewed">
        <div class="panel bottom">
            <div class="content">
                <div class="description" >
                    <h1>Stronger, Healthier, Happier</h1>
                    <pre class="pre2">
여기서는 운동을 좋아하는 사람들이 모여
자유롭게 의견을 나누고 소통할 수 있는 공간을 제공합니다.
다양한 운동 종목을 즐기는 사람들과 함께 지식을 교환하고,
운동 관련 질문에 대한 답변을 얻을 수 있습니다.
함께 운동을 즐기며 새로운 친구들을 만나보세요.
                    </pre>
                </div>

                <img src="/resources/images/main/health.png" alt="Original">
            </div>
        </div>

        <div class="panel top">
            <div class="content">
                <div class="description">
                    <h1 style="color: rgb(44, 44, 44); font-weight: bold;">Find Your Fit</h1>
                    <pre class="pre1" style="color: rgb(44, 44, 44);">
운동 성과를 기록하고 추적하여 
자신의 발전을 확인하고 공유할 수 있습니다.
우리는 각 사용자의 운동 기록을 시각화하여
진척 상황을 쉽게 파악할 수 있도록 돕고,
다른 운동 열정가들과 함께 기록을 공유하며
서로를 격려하고 자극할 수 있는 기회를 제공합니다.
                    </pre>
                </div>

                <img src="/resources/images/main/health.png" alt="Duotone">
            </div>
        </div>

        <div class="handle"></div>
    </div>
    
    <script>
       
       document.addEventListener('DOMContentLoaded', function() {
            var parent = document.querySelector('.splitview'),
                topPanel = parent.querySelector('.top'),
                handle = parent.querySelector('.handle');

            parent.addEventListener('mousemove', function(event) {
                // Move the handle.
                handle.style.left = event.clientX  + 'px';

                // Adjust the top panel width.
                topPanel.style.width = event.clientX + 'px';
            });
        });
    </script>
</body>
</html>
