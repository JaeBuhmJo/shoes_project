// document.querySelector("#shoesForm").addEventListener("submit", (e) => {
//   e.preventDefault();

//   // 폼 데이터 수집
//   var form = e.target;

//   var productColor = form.querySelector("#productColor").value;
//   var productSize = form.querySelector("#productSize").value;
//   var cartAmount = form.querySelector("#cartAmount").value;

//   //AJAX 요청

//   var requestOptions = {
//     method: "post",
//     headers: {
//       "Content-Type": "application/json",
//       "X-CSRF-TOKEN": csrfToken,
//     },
//     body: JSON.stringify({
//       productColor: productColor,
//       productSize: productSize,
//       cartAmount: cartAmount,
//     }),
//   };

//   fetch("/cart/cart", requestOptions)
//     .then((response) => {
//       if (response.ok) {
//         return response.json();
//       } else {
//         throw new Error("Request failed.");
//       }
//     })
//     .then((data) => {
//       console.log(data);
//     })
//     .catch((error) => console.log(error));
// });

const shoesForm = document.querySelector("#shoesForm");

shoesForm.addEventListener("submit", (e) => {
  e.preventDefault();
  //선택한 사이즈 가져오기
  var sizeSelect = document.getElementById("productSize");
  var selectedSize = sizeSelect.value;

  var colorSelect = document.getElementById("productColor");
  var selectedColor = colorSelect.value;

  if (selectedSize.value === "") {
    alert("사이즈를 선택해주세요");
    return;
  }
  if (selectedColor.value === "") {
    alert("색상을 선택해주세요");
    return;
  }

  //수량 가져오기
  var amountInput = document.getElementById("cartAmount");
  var selectedAmount = amountInput.value;

  if (selectedAmount === "") {
    alert("수량을 입력해 주세요");
    return;
  }

  if (isNaN(selectedAmount)) {
    alert("숫자만 입력해주세요");
    return;
  }

  const price = document.querySelector("#price").innerHTML;
  const name = document.querySelector("#productName").innerHTML;
  //선택한 정보 출력
  console.log("Price: " + price);
  console.log("Brand: " + name);
  console.log("size: " + selectedSize);
  console.log("color: " + selectedColor);
  console.log("amount: " + selectedAmount);

  // 폼 submit
  //  detailForm.submit();
  //사이즈랑 가격,브랜드 보내기
  fetch("/cart/cart", {
    method: "post",
    body: JSON.stringify({
      size: selectedSize,
      color: selectedColor,
      amount: selectedAmount,
      price: price,
      name: name,
    }),
    headers: {
      "X-CSRF-TOKEN": csrfToken,
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
      shoesForm.submit();
    })
    .catch((error) => console.log(error));
});
