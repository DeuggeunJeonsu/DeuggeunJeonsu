// 팔로잉, 언팔로우 버튼 토글
const customBtns = document.querySelectorAll('.customBtn');

customBtns.forEach((button) => {

    button.addEventListener('click', () => {

        if (button.classList.contains('unfollowBtn')) {
            button.classList.remove('unfollowBtn');
            button.classList.add('followingBtn');
            button.querySelector('div').textContent = 'following';

        } else {
            button.classList.remove('followingBtn');
            button.classList.add('unfollowBtn');
            button.querySelector('div').textContent = 'follow';
        }

    });

});

// 팔로잉, 팔로워 목록 버튼 토글
const followListBtns = document.querySelectorAll(".followListBtn");

followListBtns.forEach((btn)=>{

    btn.addEventListener("click", () => {

        followListBtns.forEach((otherBtn) => {
            otherBtn.classList.remove("listBtnClick");
        });
        
        btn.classList.add("listBtnClick");
    })
})