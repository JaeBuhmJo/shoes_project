document.getElementById("goCart").addEventListener("submit", (e) => {
  e.preventDefault();

  // const form = document.querySelector("#operForm");
  // form.submit();

  // 가격, 브랜드, 카테고리 보낼 준비
  const cartItem = {
    brand: document.getElementById("brandcart").innerHTML,
    category: document.getElementById("categorycart").innerHTML,
    price: document.getElementById("pricecart").innerHTML,
    size: document.getElementById("productSize").value,
    count: document.querySelector("#productCnt").value,
  };

  //사이즈랑 가격,브랜드,카테고리 보내기
  fetch("/member/cart", {
    method: "post",
    body: JSON.stringify(cartItem),
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
    })
    .catch((error) => console.log(error));
});
