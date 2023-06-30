function displayRating(rating) {
  let stars = "";

  const fullstars = Math.floor(rating);
  const halfStar = rating - fullstars >= 0.5;

  for (let i = 1; i <= 5; i++) {
    if (i <= fullstars) {
      stars += "<i class='fas fa-star'></i>";
    } else if (halfStar && i === fullstars + 1) {
      stars += "<i class='fas fa-star-half-alt'></i>";
    } else {
      stars += "<i class='far fa-star'></i>";
    }
  }
  return stars;
}
document.addEventListener("DOMContentLoaded", () => {
  // 각 리뷰의 별점을 맞게 채우기
  const ratings = [];
  document.querySelectorAll(".rating").forEach((ratingElement) => {
    const jumsu = parseInt(ratingElement.getAttribute("data-jumsu"), 10);
    ratings.push(jumsu);
    ratingElement.innerHTML = displayRating(jumsu);
  });

  // 평균 점수 계산
  const averageRating = calculateAverageRating(ratings);

  // 평균 별점 표시
  const averageRatingElement = document.getElementById("averageRating");
  averageRatingElement.innerHTML = displayRating(averageRating.toFixed(1)); // 소수점 1자리까지 나타냅니다.
});

// 페이지 넘어가는 기능

const shoesForm = document.querySelector("#shoesForm");

shoesForm.addEventListener("submit", (e) => {
  e.preventDefault();
  //선택한 사이즈 가져오기
  var size = document.getElementById("productSize").value;
  var color = document.getElementById("productColor").value;
  if (size.value === "" || color.value === "") {
    alert("사이즈와 색상을 선택해주세요");
    return;
  }

  //수량 가져오기
  var amount = document.getElementById("cartAmount").value;

  if (amount === "" || isNaN(amount)) {
    alert("수량을 입력해 주세요", "숫자만 입력해 주세요");
    return;
  }

  const memberId = document.querySelector("#memberId").value;
  const inventoryId = document.querySelector("#inventoryId").value;

  // 폼 submit
  //  detailForm.submit();
  //사이즈랑 가격,브랜드 보내기
  fetch("/customer/cart", {
    method: "post",
    headers: {
      "X-CSRF-TOKEN": csrfToken,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      //db에 넘어가는 값들을 넘겨주기
      cartAmount: amount,
      productId,
      memberId: memberId,
      inventoryId: inventoryId,
    }),
  })
    .then((response) => {
      if (response.ok) {
        window.location, (href = "/shoes/detail");
      } else {
        throw new Error("카트에 전송 실패");
      }
    })
    // .then((data) => {
    //   console.log(data);
    //   //      shoesForm.submit();
    // })
    .catch((error) => console.log(error));
});
