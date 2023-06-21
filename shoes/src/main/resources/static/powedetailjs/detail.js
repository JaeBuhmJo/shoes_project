document.querySelector("#goCart").addEventListener("click", (e) => {
  e.preventDefault();

  // 가격, 브랜드, 카테고리 보낼 준비
  const cartItem = {
    brand: document.querySelector("#brandcart").innerHTML,
    category: document.querySelector("#categorycart").innerHTML,
    price: document.querySelector("#pricecart").innerHTML,
    size: document.querySelector("#size").value,
  };

  //사이즈랑 가격,브랜드,카테고리 보내기
  fetch("/member/cart", {
    method: "post",
    body: JSON.stringify(cartItem),
    headers: {
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
