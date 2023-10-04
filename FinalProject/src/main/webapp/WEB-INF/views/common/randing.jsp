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
    z-index: 1;
}

    .bottom .description {
        right: 5%;
    }

.top {
    background-color: #99e1ed;
    z-index: 2;
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
        z-index: 3;
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


    </style>

</head>
<body>
    
    <div class="splitview skewed">
        <div class="panel bottom">
            <div class="content">
                <div class="description">
                    <h1>Stronger, Healthier, Happier</h1>
                    <p>Stronger, Healthier, Happier</p>
                </div>

                <img src="/resources/images/main/health.png" alt="Original">
            </div>
        </div>

        <div class="panel top">
            <div class="content">
                <div class="description">
                    <h1>Find Your Fit</h1>
                    <p>The one and only workout Partner.</p>
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
        handle = parent.querySelector('.handle'),
        skewHack = 0,
        delta = 0;

    // If the parent has .skewed class, set the skewHack var.
    if (parent.className.indexOf('skewed') != -1) {
        skewHack = 1000;
    }

    parent.addEventListener('mousemove', function(event) {
        // Get the delta between the mouse position and center point.
        delta = (event.clientX - window.innerWidth / 2) * 0.5;

        // Move the handle.
        handle.style.left = event.clientX + delta + 'px';

        // Adjust the top panel width.
        topPanel.style.width = event.clientX + skewHack + delta + 'px';
    });
});
    </script>
</body>
</html>
