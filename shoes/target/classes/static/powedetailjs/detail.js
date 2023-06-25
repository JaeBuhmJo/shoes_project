// document.getElementById("detailForm").addEventListener("submit", (e) => {
//   e.preventDefault();
//   // 가격, 브랜드, 카테고리 보낼 준비
//   const cartItem = {
//     brand: document.getElementById("brand").innerHTML,
//     category: document.getElementById("category").innerHTML,
//     price: document.getElementById("price").innerHTML,
//     size: document.getElementById("productSize").value,
//     count: document.querySelector("#cartAmount").value,
//   };
//   if (isNaN(document.querySelector("#cartAmount").value)) {
//     alert("숫자만 입력해주세요");
//   }

//   //사이즈랑 가격,브랜드,카테고리 보내기
//   // fetch("/member/cart", {
//   //   method: "post",
//   //   body: JSON.stringify(cartItem),
//   //   headers: {
//   //     //      "X-CSRF-TOKEN": csrfToken,
//   //     "Content-Type": "application/json",
//   //   },
//   // })
//   //   .then((response) => {
//   //     if (!response.ok) {
//   //       throw new Error("카트에 전송 실패");
//   //     }
//   //     return response.json();
//   //   })
//   //   .then((data) => {
//   //     console.log(data);
//   //   })
//   //   .catch((error) => console.log(error));
//   detailForm.submit(cartItem);
// });
const detailForm = document.getElementById("detailForm");

detailForm.addEventListener("submit", (e) => {
  e.preventDefault();
  //선택한 사이즈 가져오기
  var sizeSelect = document.getElementById("productSize");
  var selectedSize = sizeSelect.value;

  if ((selectedSize.value = "")) {
    alert("사이즈를 선택해주세요");
  }

  //수량 가져오기
  var amountInput = document.getElementById("cartAmount");
  var selectedAmount = amountInput.value;

  if (isNaN.selectedAmount) {
    alert("숫자만 입력해주세요");
    return;
  }

  const category = document.querySelector("#category").innerHTML;
  const price = document.querySelector("#price").innerHTML;
  const brand = document.querySelector("#brand").innerHTML;
  //선택한 정보 출력
  console.log("Category : " + category);
  console.log("Price: " + price);
  console.log("Brand: " + brand);
  console.log("selected Size: " + selectedSize);
  console.log("selected Amount: " + selectedAmount);

  // 폼 submit
  //  detailForm.submit();
  //사이즈랑 가격,브랜드,카테고리 보내기
  fetch("/member/cart", {
    method: "post",
    body: JSON.stringify({
      size: selectedSize,
      amount: selectedAmount,
      category: category,
      price: price,
      brand: brand,
    }),
    headers: {
      //      "X-CSRF-TOKEN": csrfToken,
      "Content-Type": "application/json",
    },
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("카트에 전송 실패");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
      detailForm.submit();
    })
    .catch((error) => console.log(error));
});
