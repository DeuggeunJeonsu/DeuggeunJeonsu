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

// const inquireForm = document.getElementById("inquireForm");
// const inquireTitle = document.getElementById("inquireTitle");
// const inquireContent = document.getElementById("inquireContent");

// inquireForm.addEventListener("submit", function (e) {

//     // 제목에 특수문자만 있는지 검사
//     const regEx = /^[~!@#$%^&*()_\-+=|<>,./?"''';]+$/;
//     if (regEx.test(inquireTitle.value)) {
//         alert("제목은 특수문자로만 구성될 수 없습니다.");
//         inquireTitle.focus();
//         inquireTitle.value = ""; // 제목 내용을 지우기
//         e.preventDefault(); // 폼 제출 막기
//     }
//     // 내용 유효성 검사
//     if (inquireContent.value.length === 0 || inquireContent.value.length > 500) {
//         alert("내용을 입력하세요 (1자 이상, 500자 이내).");
//         e.preventDefault(); // 폼 제출 막기
//     }
// });

// inquireContent.addEventListener("focus", function () {
//     if (inquireTitle.value.trim() === "") {
//         alert("제목을 입력해주세요.");
//         inquireTitle.focus(); // 제목 입력란으로 포커스 이동
//     }
// });
const inquireForm = document.getElementById("inquireForm");
const inquireType = document.getElementById("inquireType");
const inquireTitle = document.getElementById("inquireTitle");
const inquireContent = document.getElementById("inquireContent");

inquireForm.addEventListener("submit", function (e) {
    e.preventDefault(); // 폼 제출 막기

    // 문의 유형 선택 여부 검사
    if (inquireType.value === "none") {
        Swal.fire({
            icon: 'error',
            title: '문의 유형 오류',
            text: '문의 유형을 선택하세요.'
        });
        return;
    }

    // 제목 유효성 검사
    let titleValue = inquireTitle.value.trim();
    if (titleValue === "") {
        Swal.fire({
            icon: 'error',
            title: '제목 오류',
            text: '제목을 입력하세요 (1자 이상, 10자 이내).'
        }).then(function () {
            inquireTitle.focus();
            inquireTitle.value = ""; // 빈 문자열로 설정
        });
        return;
    }

    if (titleValue.length < 1 || titleValue.length > 10) {
        Swal.fire({
            icon: 'error',
            title: '제목 오류',
            text: '제목을 1자 이상, 10자 이내로 입력하세요.'
        }).then(function () {
            inquireTitle.focus();
            inquireTitle.value = ""; // 빈 문자열로 설정
        });
        return;
    }

    // 내용 유효성 검사
    let contentValue = inquireContent.value.trim();
    if (contentValue === "") {
        Swal.fire({
            icon: 'error',
            title: '내용 오류',
            text: '내용을 입력하세요.'
        }).then(function () {
            inquireContent.focus();
        });
        return;
    }

    // 글씨 500자 제한
    if (contentValue.length > 500) {
        Swal.fire({
            icon: 'error',
            title: '내용 오류',
            text: '내용은 500자 이내로 입력하세요.'
        }).then(function () {
            inquireContent.focus();
        });
        return;
    }

    // 유효성 검사 통과 시 폼 제출
    inquireForm.submit();
});
