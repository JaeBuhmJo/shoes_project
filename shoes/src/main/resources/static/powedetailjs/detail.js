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
    alert("사이즈를 선택해주세요");
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
  fetch("/cart/cart", {
    method: "post",
    body: JSON.stringify({
      size: selectedSize,
      amount: selectedAmount,
      category: category,
      price: price,
      brand: brand,
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
