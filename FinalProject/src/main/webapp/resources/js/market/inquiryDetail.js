// 목록으로 버튼
const goToListBtn = document.getElementById("goToListBtn");

goToListBtn.addEventListener("click", () => {
    const boardCode = 5;

    let url = `/board/${boardCode}/inquire/${productNo}`;

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

// 게시글 삭제 버튼 클릭 시
const deleteBtn = document.getElementById("deleteBtn");
if (deleteBtn !== null) {
    deleteBtn.addEventListener("click", () => {

        if (confirm("정말 삭제하시겠습니까?")) {
            const deleteUrl = `/board/inquiry/${inquiryNo}/delete/${productNo}`;
            location.href = deleteUrl;
        }
    });
}
