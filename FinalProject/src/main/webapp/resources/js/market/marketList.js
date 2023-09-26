// 자동완성 기능
$('#market-search').autocomplete({
    source: function (request, response) {
        $.ajax({
            url: "/board/market/autocomplete",
            type: "POST",
            dataType: "JSON",
            data: { value: request.term },	// 검색 키워드
            success: function (data) {
                response(
                    $.map(data.resultList, function (item) {
                        return {
                            label: item.PRODUCT_TITLE || item.PRODUCT_NAME, // 목록에 표시되는 값. PRODUCT_TITLE이 없으면 PRODUCT_NAME을 사용
                            value: item.PRODUCT_TITLE || item.PRODUCT_NAME, // 선택 시 input창에 표시되는 값
                        };
                    })

                );
            },
            error: function () {
                alert("오류가 발생했습니다.");
            }
        });
    },
    focus: function (event, ui) {
        return false;
    },
    minLength: 1,
    autoFocus: false,
    delay: 100,
    select: function (evt, ui) {
        console.log(ui.item.label);
    }
});

/********************************************************************************/

// 현재 URL의 쿼리 파라미터에서 특정 값을 가져오는 함수
function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

// 페이지 로드 시 sort 값을 사용하여 select box 값을 설정
document.addEventListener('DOMContentLoaded', function() {
    const sortValue = getQueryParam('sort');
    if (sortValue) {
        document.getElementById('type').value = sortValue;
    }
});

// 옵션 변경 시 페이지를 다시 로드하는 코드
document.getElementById('type').addEventListener('change', function() {
    const selectedValue = this.value;
    let boardCode = 5;
    let url = `/board/${boardCode}/list?sort=${selectedValue}`;
    window.location.href = url;
});

document.getElementById('type').addEventListener('change', function() {
    const selectedValue = this.value;

    let boardCode = 5;
    // let searchParam = '${param.keyword}';

    let url = `/board/${boardCode}/list?sort=${selectedValue}`;

    window.location.href = url;
});
