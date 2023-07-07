/**
 *
 */

//폼 제출 이벤트 리스너 추가

const reviewForm = document.querySelector("#reviewForm");
reviewForm.addEventListener("submit", (e) => {
  e.preventDefault();

  //리뷰점수 가져오기
  let jumsu = document.querySelector("input[name='jumsu']:checked").value;
  console.log("jumsu", jumsu);
  const contents = document.querySelector("#contents").value;
  console.log("contents", contents);
  //현재 URL 가져오기
  const urlParams = new URLSearchParams(window.location.search);
  //const productId = productId;
  const productId = urlParams.get("productId");
  console.log("productId", productId);

  reviewForm.submit();
});

// 후기 내용 가져오기

// 서버로 데이터 전송
//     fetch("/shoes/detail", {
//       method: "post",
//       headers: {
//         "Content-Type": "application/json",
//         "X-CSRF-TOKEN": csrfToken,
//       },
//       body: JSON.stringify(data),
//     })
//       .then((response) => {
//         if (response.ok) {
//           console.log("리뷰 전송 성공");
//         } else {
//           console.log("리뷰 전송 실패");
//         }
//       })
//       .catch((error) => console.log("리뷰 전송 중 오류 발생", error));
//   } else {
//     alert("리뷰 점수와 후기 내용을 모두 입력해 주세요");
//   }
// });
