
function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

document.addEventListener('DOMContentLoaded', function() {
    const keyValue = getQueryParam("key");
    if (keyValue) {
        document.getElementById("selectBox").value = keyValue;
    }
});

document.getElementById("selectBox").addEventListener('change', function() {
    const keyValue = this.value;
    let url = `/myPage/myPurchaseList?key=${keyValue}`;
    window.location.href = url;
});