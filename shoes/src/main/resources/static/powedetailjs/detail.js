// 페이지 넘어가는 기능

const pagination = document.querySelector(".pagination");
const operForm = document.querySelector("#operForm");

pagination.addEventListener("click", (e) => {
  e.preventDefault();

  let href = e.target.getAttribute("href");

  operForm.firstElementChild.value = href;

  operForm.submit();
});

// //cartId 조회 요청
// var memberId = document.querySelector("#memberId").value;
// fetch("member/cartId?memberId=" + memberId)
//   .then((response) => {
//     if (!response.ok) {
//       throw new Error("cartId 조회 실패");
//     }
//     return response.json();
//   })
//   .then((data) => {
//     var cartId = data.cartId;
//     // cartId를 hidden input 필드에 설정
//     document.querySelector("#cartId").value = cartId;
//   })
//   .catch((error) => console.log(error));

//size에 변경 이벤트가 일어나면
const inventoryId = document.querySelector("#productSize");
// inventoryId.addEventListener("change", (e) => {
//   e.preventDefault();
//   const productId = document.getElementById("productId");

//   var size = document.getElementById("productSize").value;
//   var color = document.getElementById("productColor").value;
//   // inventoryId 조회 요청
//   fetch(
//     "/product/inventoryId?color=" +
//       encodeURIComponent(color) +
//       "&size=" +
//       encodeURIComponent(size) +
//       "&productId=" +
//       encodeURIComponent(productId)
//   )
//     .then((response) => {
//       if (response.ok) {
//         return response.json();
//       } else {
//         throw new Error("inventoryId 조회 실패");
//       }
//     })
//     .then((data) => {
//       console.log("선택된 제품의 inventoryId", data);
//       const inventoryId = data;
//       //inventoryId를 사용하여 필요한 작업 수행
//       // 예 : 장바구니에 추가, 동적 수행 등
//       document.getElementById("inventoryId").value = inventoryId;
//     })
//     .catch((error) => console.log(error));
// });

document.getElementById("productColor").addEventListener("change", () => {
  const productColor = this.value;
  const productId = document.getElementById("productId").value;
  const productSize = document.getElementById("productSize").value;

  if (productColor && productSize) {
    getInventoryId(productId, productSize, productColor);
  }
});

document.getElementById("productSize").addEventListener("change", () => {
  const productSize = this.value;
  const productColor = document.getElementById("productColor").value;
  const productId = document.getElementById("productId").value;

  if (productColor && productSize) {
    getInventoryId(productId, productSize, productColor);
  }
});

async function getInventoryId(productId, productSize, productColor) {
  const response = await fetch(
    `/shoes/getInventoryId?productId=${productId}&productSize=${productSize}&productColor=${productColor}`
  );
  const inventoryId = await response.text();
  document.getElementById("inventoryId").value = inventoryId;
}

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
  const productId = document.querySelector("#productId").value;
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
      productId: productId,
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

// var loading = false;
// var currentPage = 1;

// window.addEventListener("scroll", () => {
//   var scrollTop = document.documentElement.scrollTop;
//   var windowHeight = window.innerHeight;
//   var documentHeight = document.documentElement.scrollHeight;

//   if (scrollTop + windowHeight >= documentHeight && !loading) {
//     loadReviews(currentPage + 1);
//   }
//   loadReviews(1);
// });
