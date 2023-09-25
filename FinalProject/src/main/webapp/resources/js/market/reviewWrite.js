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
    e.preventDefault(); // 폼 제출 막기

    // 제목 유효성 검사
    let titleValue = reviewTitle.value.trim();
    if (titleValue === "") {
        Swal.fire({
            icon: 'error',
            title: '제목 오류',
            text: '제목을 입력하세요 (1자 이상, 10자 이내).'
        }).then(function () {
            reviewTitle.focus();
            reviewTitle.value = ""; // 빈 문자열로 설정
        });
        return;
    }

    if (titleValue.length < 1 || titleValue.length > 10) {
        Swal.fire({
            icon: 'error',
            title: '제목 오류',
            text: '제목을 1자 이상, 10자 이내로 입력하세요.'
        }).then(function () {
            reviewTitle.focus();
            reviewTitle.value = ""; // 빈 문자열로 설정
        });
        return;
    }

    // 내용 유효성 검사
    let contentValue = reviewContent.value.trim();
    
    if (contentValue === "" || contentValue.length > 500) {
        Swal.fire({
            icon: 'error',
            title: '내용 오류',
            text: '내용을 입력하세요 (1자 이상, 500자 이내).'
        }).then(function () {
            reviewContent.focus();
            reviewContent.value = ""; // 빈 문자열로 설정
        });
        return;
    }

    // 유효성 검사 통과 시 폼 제출
    reviewTitle.value = titleValue;
    reviewContent.value = contentValue;
    reviewForm.submit();
});

// 엔터 키 눌렀을 때 SweetAlert2 알림 닫기
document.addEventListener("keydown", function (e) {
    if (e.key === "Enter" && Swal.isVisible()) {
        e.preventDefault();
        Swal.close();
        
        if (!reviewTitle.value) {
            reviewTitle.focus();
        } else if (!reviewContent.value) {
            reviewContent.focus();
        }
    }
});
document.getElementById('cancel-button').addEventListener('click', function() {
    window.history.back();
});
