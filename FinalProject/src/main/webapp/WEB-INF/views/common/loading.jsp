<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로딩창 애니메이션</title>
    <style>
        .loading-body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .loading-body span {
            display: inline-block;
            width: 10px;
            height: 10px;
            background-color: rgb(128, 128, 128);
            border-radius: 50%;
            animation: loading 1s 0s linear infinite;
        }

        .loading-body span:nth-child(1) {
            animation-delay: 0s;
            background-color: red;
        }

        .loading-body span:nth-child(2) {
            animation-delay: 0.2s;
            background-color: orange;
        }

        .loading-body span:nth-child(3) {
            animation-delay: 0.4s;
            background-color: yellowgreen;
        }

        @keyframes loading {
            0%, 100% {
                opacity: 0;
                transform: scale(0.5);
            }
            50% {
                opacity: 1;
                transform: scale(1.2);
            }
        }
    </style>
</head>
<body>
<div class="loading-body" style="display: none;">
    <span></span>
    <span></span>
    <span></span>
</div>
</body>
</html>
