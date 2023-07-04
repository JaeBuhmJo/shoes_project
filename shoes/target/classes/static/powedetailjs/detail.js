function displayRating(rating) {
  let stars = "";

  const fullstars = Math.floor(rating);

  for (let i = 1; i <= 5; i++) {
    if (i <= fullstars) {
      stars += "<i class='fas fa-star'></i>";
    } else {
      stars += "<i class='far fa-star'></i>";
    }
  }
  return stars;
}

function calculateAverageRating(ratingsArray) {
  if (ratingsArray.length === 0) {
    return "";
  }
  const sumRating = ratingsArray.reduce((acc, curr) => acc + curr, 0);
  return sumRating / ratingsArray.length;
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
  const averageRating = parseFloat(calculateAverageRating(ratings));

  // 평균 별점 표시
  const averageRatingElement = document.getElementById("averageRating");
  console.log(averageRating);
  averageRatingElement.innerHTML = displayRating(averageRating.toFixed(1)); // 소수점 1자리까지 나타냅니다.
});

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
        alert("선택하신 상품을 카트에 담았습니다.");
      } else {
        throw new Error("카트에 전송 실패");
      }
    })

    .catch((error) => console.log(error));
});
