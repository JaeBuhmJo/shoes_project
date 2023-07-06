const shoesForm = document.querySelector("#shoesForm");
shoesForm.addEventListener("submit", (e) => {
  e.preventDefault();
  //선택한 사이즈 가져오기
  var size = document.getElementById("productSize").value;
  var color = document.getElementById("productColor").value;
  if (color.value === "" && size.value === "" && amount === "") {
    alert("색상을 선택해주세요");
    return;
  } else if (size.value === "" && amount === "") {
    alert("사이즈를 선택해주세요");
    return;

    //수량 가져오기
  } else {
    var amount = document.getElementById("cartAmount").value;

    if (amount === "" || isNaN(amount)) {
      alert("수량을 입력해 주세요", "숫자만 입력해 주세요");
      return;
    }
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
