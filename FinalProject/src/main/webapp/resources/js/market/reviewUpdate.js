// // // 첨부한 이미지 미리보기
// // $(document).ready(function () {
// //     var fileTarget = $('.fileBox .inputHidden');
// //
// //     fileTarget.on('change', function () {
// //         if (window.FileReader) {
// //             // 파일명 추출
// //             var filename = $(this)[0].files[0].name;
// //         }
// //
// //         else {
// //             // Old IE 파일명 추출
// //             var filename = $(this).val().split('/').pop().split('\\').pop();
// //         };
// //
// //         $(this).siblings('.uploadFileName').val(filename);
// //     });
// //
// //     //preview image
// //     var imgTarget = $('.previewImage .inputHidden');
// //
// //     imgTarget.on('change', function () {
// //         var parent = $(this).parent();
// //         parent.children('.uploadDisplay').remove();
// //
// //         if (window.FileReader) {
// //             //image 파일만
// //             if (!$(this)[0].files[0].type.match(/image\//)) return;
// //
// //             var reader = new FileReader();
// //             reader.onload = function (e) {
// //                 var src = e.target.result;
// //                 parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
// //             }
// //             reader.readAsDataURL($(this)[0].files[0]);
// //         }
// //
// //         else {
// //             $(this)[0].select();
// //             $(this)[0].blur();
// //             var imgSrc = document.selection.createRange().text;
// //             parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
// //
// //             var img = $(this).siblings('.uploadDisplay').find('img');
// //             img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
// //         }
// //     });
// // });
// //

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



const writeFrm = document.getElementById("write-form");

writeFrm.addEventListener("submit", e => {

    const title = document.getElementById("title-textArea");

    if(title.value.trim().length == 0){
        alert("제목을 입력해주세요");
        title.value = "";
        title.focus();

        e.preventDefault();
        return;
    }

    const content = document.getElementById("reviewContent");

    if(content.value.trim().length == 0){
        alert("내용을 입력해 주세요");
        content.value = "";
        content.focus();

        e.preventDefault();
        return;
    }
})


const cancelBtn = document.getElementById("cancel-btn");
cancelBtn.addEventListener("click", ()=>{

    let url = "/board/5/review/" + reviewNo + "/detail"

    location.href = url;
})