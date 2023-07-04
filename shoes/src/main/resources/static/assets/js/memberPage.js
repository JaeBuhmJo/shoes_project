/*
 하단의 페이지 번호 클릭 시
 a 태그 기본 기능 중지
 a 태크 href 값 가져온 후 operForm의 page 요소의 value 값으로 세팅
 actionForm 전송
*/

const pagination = document.querySelector(".pagination");
const operForm = document.querySelector("#operForm");

pagination.addEventListener("click", (e) => {
  if (e.target.tagName === "A") {
    e.preventDefault();

    //href 값 가져오기
    let href = e.target.getAttribute("href");

    //operForm 안의 page value 수정
    operForm.firstElementChild.value = href;
    console.log(operForm);

    operForm.submit();
  }
});

// 상단의 amount 수정 시 operForm의 amount 요소의 value 값으로 세팅
// actionForm 전송
const amount = document.querySelector("#amount");

amount.addEventListener("change", (e) => {
  // 선택한 amount 값 가져오기
  const val = e.target.value;

  const amount = document.querySelector("#operForm input:nth-child(2)");
  amount.value = val;

  operForm.submit();
});

// 검색 클릭 시
// type, keyword 입력 여부 확인
// 입력이 안된 경우 : 경고창 보여주기
// 입력이 다 된 경우 : 폼 submit
//
const searchForm = document.querySelector("#searchForm");
searchForm.addEventListener("submit", (e) => {
  const searchType = document.querySelector("#searchType");
  const keyword = document.querySelector("#keyword");
  e.preventDefault();

  if (searchType.value === "") {
    alert("타입을 선택해주세요");
    searchType.focus();
    return;
  } else if (keyword.value === "") {
    alert("내용을 입력해주세요");
    keyword.focus();
    return;
  }

  searchForm.submit();
});
