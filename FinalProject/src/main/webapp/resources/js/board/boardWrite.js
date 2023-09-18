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

// 게시글 삭제 버튼 클릭 시
const deleteBtn = document.getElementById("deleteBtn");
if (deleteBtn !== null) {
    deleteBtn.addEventListener("click", () => {
        if (confirm("정말 삭제하시겠습니까?")) {
            const deleteUrl = `/board/${reviewNo}/delete/${productNo}`;
            location.href = deleteUrl;
        }
    });
}

// 목록으로 버튼
const goToListBtn = document.getElementById("goToListBtn");

goToListBtn.addEventListener("click", () => {
    const boardCode = 5;

    let url = `/board/${boardCode}/review/${productNo}`;

    const params = new URL(location.href).searchParams;

    let cp;
    if (params.get("cp") !== null) { // 쿼리스트링에 cp가 있을 경우
        cp = params.get("cp");
    } else {
        cp = 1; // 기본값
    }

    url += `?cp=${cp}`;

    if (params.get("key") !== null) {
        const key = params.get("key");
        const query = params.get("query");

        url += `&key=${key}&query=${query}`;
    }

    location.href = url;
});
