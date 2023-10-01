// 첨부한 이미지 미리보기
// $(document).ready(function () {
//     var fileTarget = $('.fileBox .inputHidden');
//
//     fileTarget.on('change', function () {
//         if (window.FileReader) {
//             // 파일명 추출
//             var filename = $(this)[0].files[0].name;
//         }
//
//         else {
//             // Old IE 파일명 추출
//             var filename = $(this).val().split('/').pop().split('\\').pop();
//         };
//
//         $(this).siblings('.uploadFileName').val(filename);
//     });
//
//     //preview image
//     var imgTarget = $('.previewImage .inputHidden');
//
//     imgTarget.on('change', function () {
//         var parent = $(this).parent();
//         parent.children('.uploadDisplay').remove();
//
//         if (window.FileReader) {
//             //image 파일만
//             if (!$(this)[0].files[0].type.match(/image\//)) return;
//
//             var reader = new FileReader();
//             reader.onload = function (e) {
//                 var src = e.target.result;
//                 parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
//             }
//             reader.readAsDataURL($(this)[0].files[0]);
//         }
//
//         else {
//             $(this)[0].select();
//             $(this)[0].blur();
//             var imgSrc = document.selection.createRange().text;
//             parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
//
//             var img = $(this).siblings('.uploadDisplay').find('img');
//             img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
//         }
//     });
// });
// document.addEventListener("DOMContentLoaded", function() {
//     const cancelButton = document.getElementById("cancel-button");
//
//     if (cancelButton !== null) {
//         cancelButton.addEventListener("click", function() {
//             window.history.back();
//         });
//     }
// });
$(document).ready(function () {
    var imgTarget = $('.previewImage .inputHidden');

    imgTarget.on('change', function () {
        var parent = $(this).parent();

        // 입력 값이 변경되면 기존 이미지를 삭제합니다.
        parent.find('.src').remove();

        if (window.FileReader) {
            // 새로 선택된 파일이 이미지인지 확인
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend('<img src="' + src + '" class="src">');
            };
            reader.readAsDataURL($(this)[0].files[0]);
        } else { // IE9 이하에서는 다른 방식을 사용
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<img class="src" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enable=\'true\',sizingMethod=\'scale\',src=\'' + imgSrc + '\')">');
        }
    });
});

const deleteImage = document.getElementById("deleteImage");
const uploadFileName = document.querySelector(".uploadFileName");

deleteImage.addEventListener("click", () => {
    // 이미지 미리보기 삭제
    const imageElement = document.querySelector(".src");
    if (imageElement) {
        imageElement.remove();
    }

    // input[type=file] 값 초기화
    const fileInput = document.getElementById("file1");
    fileInput.value = "";

    // uploadFileName의 value 초기화
    uploadFileName.value = "";
});

// 이미지 삭제 버튼 이벤트
$('#deleteImage').on('click', function() {
    // 이미지와 input field 초기화
    $('.src').remove();
    $('.uploadFileName').val("");
    $('#file1').val("");
    document.getElementById("imageDeleted").value = "true";

    // uploadFileName의 value를 완전히 삭제
    $('.uploadFileName').val("");
});

// 파일 첨부 시 미리보기와 파일명 표시
var fileTarget = $('.fileBox .inputHidden');
fileTarget.on('change', function() {
    if (window.FileReader) {
        var filename = $(this)[0].files[0].name;
    } else {
        var filename = $(this).val().split('/').pop().split('\\').pop();
    }

    // 파일명을 input box에 표시
    $(this).siblings('.uploadFileName').val(filename);
});

$('form').on('submit', function(e) {
    var uploadFileName = $('.uploadFileName').val();

    if (!uploadFileName) {

        $('.uploadFileName').val('null');
    }
});

// const inquireForm = document.getElementById("inquireForm");
// const inquiryType = document.getElementById("inquiryType");
// const inquireTitle = document.getElementById("inquireTitle");
// const inquireContent = document.getElementById("inquireContent");
//
// inquireForm.addEventListener("submit", function (e) {
//     e.preventDefault(); // 폼 제출 막기
//
//     // 문의 유형 선택 여부 검사
//     let type = inquiryType.value.trim()
//     if (type == "0") {
//         e.preventDefault(); // 폼 제출 막기
//         Swal.fire({
//             icon: 'error',
//             title: '문의 유형 오류',
//             text: '문의 유형을 선택하세요.'
//         });
//         return;
//     }
//     // 제목 유효성 검사
//     let titleValue = inquireTitle.value.trim();
//     if (titleValue === "") {
//         e.preventDefault(); // 폼 제출 막기
//         Swal.fire({
//             icon: 'error',
//             title: '제목 오류',
//             text: '제목을 입력하세요 (1자 이상, 10자 이내).'
//         }).then(function () {
//             inquireTitle.focus();
//             inquireTitle.value = ""; // 빈 문자열로 설정
//         });
//         return;
//     }
//
//     if (titleValue.length < 1 || titleValue.length > 10) {
//         e.preventDefault(); // 폼 제출 막기
//         Swal.fire({
//             icon: 'error',
//             title: '제목 오류',
//             text: '제목을 1자 이상, 10자 이내로 입력하세요.'
//         }).then(function () {
//             inquireTitle.focus();
//             inquireTitle.value = ""; // 빈 문자열로 설정
//         });
//         return;
//     }
//
//     // 내용 유효성 검사
//     let contentValue = inquireContent.value.trim();
//     if (contentValue === "") {
//         e.preventDefault(); // 폼 제출 막기
//         Swal.fire({
//             icon: 'error',
//             title: '내용 오류',
//             text: '내용을 입력하세요.'
//         }).then(function () {
//             inquireContent.focus();
//         });
//         return;
//     }
//
//     // 글씨 500자 제한
//     if (contentValue.length > 500) {
//         e.preventDefault(); // 폼 제출 막기
//         Swal.fire({
//             icon: 'error',
//             title: '내용 오류',
//             text: '내용은 500자 이내로 입력하세요.'
//         }).then(function () {
//             inquireContent.focus();
//         });
//         return;
//     }
//
//     // 유효성 검사 통과 시 폼 제출
//     inquireForm.submit();
// });
const inquireForm = document.getElementById("inquireForm");
const inquiryType = document.getElementById("inquiryType");
const inquireTitle = document.getElementById("inquireTitle");
const inquireContent = document.getElementById("inquireContent");

inquireForm.addEventListener("submit", function (e) {

    // 문의 유형 선택 여부 검사
    let type = inquiryType.value.trim()
    if (type == "") {
        e.preventDefault(); // 폼 제출 막기
        Swal.fire({
            icon: 'error',
            title: '문의 유형 오류',
            text: '문의 유형을 선택하세요.'
        }).then(function () {
            inquiryType.focus();
        });
        return;
    }

    // 제목 유효성 검사
    let titleValue = inquireTitle.value.trim();
    if (titleValue === "" || titleValue.length < 1 || titleValue.length > 10) {
        e.preventDefault(); // 폼 제출 막기
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
        e.preventDefault(); // 폼 제출 막기
        Swal.fire({
            icon: 'error',
            title: '내용 오류',
            text: '내용을 입력하세요.'
        }).then(function () {
            inquireContent.focus();
        });
        return;
    }

    // 글자 500자 제한 검사
    if (contentValue.length > 500) {
        e.preventDefault(); // 폼 제출 막기
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

document.addEventListener("DOMContentLoaded", function() {
    let urlParams = new URLSearchParams(window.location.search);
    let fromParam = urlParams.get('from');

    let selectOptionElement = document.getElementById('inquiryType');

    // 'from' 파라미터가 'purchase'와 일치하는지 확인
    if (fromParam === 'purchase') {
        selectOptionElement.style.display = 'block'; // 또는 'inline-block' 또는 'flex' 등
    } else {
        selectOptionElement.style.display = 'none';
    }
});

document.getElementById('cancel-btn').addEventListener('click', function() {
    window.history.back();
});
