// 첨부한 이미지 미리보기
$(document).ready(function () {
    var fileTarget = $('.fileBox .inputHidden');

    fileTarget.on('change', function () {
        if (window.FileReader) {
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        }

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.uploadFileName').val(filename);
    });

    //preview image 
    var imgTarget = $('.previewImage .inputHidden');

    imgTarget.on('change', function () {
        var parent = $(this).parent();
        parent.children('.uploadDisplay').remove();

        if (window.FileReader) {
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.uploadDisplay').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
        }
    });
});

// 제목, 내용 유효성 검사
// 제목 : 10글자
// 내용 : 500자
const reviewForm = document.getElementById("reviewForm");
const reviewTitle = document.getElementById("reviewTitle");
const reviewContent = document.getElementById("reviewContent");

reviewForm.addEventListener("submit", function (e) {

    // 제목에 특수문자만 있는지 검사
    const regEx = /^[~!@#$%^&*()_\-+=|<>,./?"''';]+$/;
    if (regEx .test(reviewTitle.value)) {
        alert("제목은 특수문자로만 구성될 수 없습니다.");
        reviewTitle.focus();
        reviewTitle.value = ""; // 제목 내용을 지우기
        e.preventDefault(); // 폼 제출 막기
    }
    // 내용 유효성 검사
    if (reviewContent.value.length === 0 || reviewContent.value.length > 500) {
        alert("내용을 입력하세요 (1자 이상, 500자 이내).");
        e.preventDefault(); // 폼 제출 막기
    }
});

reviewContent.addEventListener("focus", function () {
    if (reviewTitle.value.trim() === "") {
        alert("제목을 입력해주세요.");
        reviewTitle.focus(); // 제목 입력란으로 포커스 이동
    }
});