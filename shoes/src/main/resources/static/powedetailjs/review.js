/**
 *
 */

//폼 제출 이벤트 리스너 추가
document.querySelector("#reviewForm").addEventListener("submit", (e) => {
  e.preventDefault();

  //리뷰점수 가져오기
  var selectedStar = document.querySelector("input[name='reviewStar']:checked");
  var reviewStar = selectedStar ? selectedStar.value : null;

  // 후기 내용 가져오기
  const reviewContent = document.querySelector("#content").value;

  // 서버로 데이터 전송
  if (reviewStar && reviewContent) {
    const data = {
      star: reviewStar,
      content: reviewContent,
    };
    fetch("/member/info", {
      method: "post",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": csrfToken,
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (response.ok) {
          console.log("리뷰 전송 성공");
        } else {
          console.log("리뷰 전송 실패");
        }
      })
      .catch((error) => console.log("리뷰 전송 중 오류 발생", error));
  } else {
    alert("리뷰 점수와 후기 내용을 모두 입력해 주세요");
  }
});
