/**
 *
 */

const back = document.querySelector("#back");
back.addEventListener("click", () => {
    
  fetch("/member/memberPage")
    .then((response) => {
      // 응답을 처리하는 코드
      // 예: JSON 데이터 추출, 에러 처리 등
      return response.json();
    })
    .then((data) => {
      // 처리된 데이터를 사용하는 코드
      // 예: 데이터를 활용한 동적인 웹 페이지 생성 등
      console.log(data);
    })
    .catch((error) => {
      // 에러 처리 코드
      console.error(error);
    });
});
