/**
 *
 */
const operForm = document.querySelector("#operForm");

document.querySelector("#shopPagination").addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    document.querySelector("#operForm input[name='page']").value = e.target.getAttribute("href");
    operForm.submit();
  }
});

const listAmount = document.querySelector("#listAmount");
listAmount.addEventListener("change", () => {
  if (listAmount.value == 15) {
    page = page * 2 - 1;
  } else if (listAmount.value == 30) {
    page = Math.floor((page - 1) / 2) + 1;
  }
  document.querySelector("#operForm input[name='page']").value = page;
  document.querySelector("#operForm input[name='listAmount']").value = listAmount.value;
  operForm.submit();
});

const order = document.querySelector("#order");
order.addEventListener("change", () => {
  document.querySelector("#operForm input[name='page']").value = 1;
  document.querySelector("#operForm input[name='order']").value = order.value;
  operForm.submit();
});

const gender = document.querySelector("#gender");
gender.addEventListener("click", (e) => {
  if (e.target.tagName === "INPUT") {
    document.querySelector("#operForm input[name='gender']").value = e.target.value;
    operForm.submit();
  }
});

const category = document.querySelector("#category");
category.addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    document.querySelector("#operForm input[name='page']").value = 1;
    document.querySelector("#operForm input[name='category']").value = e.target.getAttribute("href");
    operForm.submit();
  }
});
// 아래로는 리스트의 ajax화 시도의 흔적

// document.querySelector("#shopPagination").addEventListener("click", (e) => {
//   e.preventDefault();
//   if (e.target.tagName === "A") {
//     document.querySelector("#operForm input[name='page']").value =
//       e.target.getAttribute("href");
//     page = e.target.getAttribute("href");
//     getProductList();
//   }
// });

// const idListAmount = document.querySelector("#listAmount");
// idListAmount.addEventListener("change", () => {
//   document.querySelector("#operForm input[name='page']").value = 1;
//   document.querySelector("#operForm input[name='listAmount']").value =
//     idListAmount.value;
//   listAmount = idListAmount.value;
//   getProductList();
// });

// const idOrder = document.querySelector("#order");
// idOrder.addEventListener("change", () => {
//   document.querySelector("#operForm input[name='order']").value = idOrder.value;
//   order = idOrder.value;
//   getProductList();
// });

// getProductList();

// function getProductList() {
//   fetch(
//     "/shop/getlist?page=" +
//       page +
//       "&listAmount=" +
//       listAmount +
//       "&searchType=" +
//       searchType +
//       "&keyword=" +
//       keyword +
//       "&order=" +
//       order +
//       ""
//   )
//     .then((response) => {
//       if (!response.ok) {
//         throw new Error("리스트 불러오기 실패");
//       }
//       return response.json();
//     })
//     .then((data) => {
//       showProductList(data);
//     })
//     .catch((error) => console.log(error));
// }

// function showProductList(listArr) {
//   let str = "";
//   listArr.forEach((item) => {
//     let fileCallPath = encodeURIComponent(
//       item.attachmentList[0].uploadPath +
//         "\\" +
//         item.attachmentList[0].uuid +
//         "_" +
//         item.attachmentList[0].fileName
//     );
//     str += '<div class="col-md-4">';
//     str += '<div class="card mb-4 product-wap rounded-0">';
//     str += '<div class="card rounded-0">';
//     str +=
//       '<img class="card-img rounded-0 img-fluid" src="/attachment?fileName=' +
//       fileCallPath +
//       '">';
//     str +=
//       '<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">';
//     str += '<ul class="list-unstyled">';
//     str += '<li><a class="btn btn-success text-white"';
//     str += 'href="shop-single.html"><i class="far fa-heart"></i></a></li>';
//     str += '<li><a class="btn btn-success text-white mt-2"';
//     str += 'href="shop-single.html"><i class="far fa-eye"></i></a></li>';
//     str += '<li><a class="btn btn-success text-white mt-2"';
//     str += 'href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>';
//     str += "</ul>";
//     str += "</div>";
//     str += "</div>";
//     str += '<div class="card-body">';
//     str +=
//       '<a href="shop-single.html" class="h3 text-decoration-none">' +
//       item.productName +
//       "</a>";
//     str += "<ul";
//     str += 'class="w-100 list-unstyled d-flex justify-content-between mb-0">';
//     str += "<li>" + item.brand + "</li>";
//     str += '<li class="pt-2"><span';
//     str +=
//       'class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>';
//     str += "<span";
//     str +=
//       'class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>';
//     str += "<span";
//     str +=
//       'class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>';
//     str += "<span";
//     str +=
//       'class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>';
//     str += "<span";
//     str +=
//       'class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>';
//     str += "</li>";
//     str += "</ul>";
//     str += '<ul class="list-unstyled d-flex justify-content-center mb-1">';
//     str += '<li><i class="text-warning fa fa-star"></i> ';
//     str += '<i class="text-warning fa fa-star"></i> ';
//     str += '<i class="text-warning fa fa-star"></i> ';
//     str += '<i class="text-muted fa fa-star"></i> ';
//     str += '<i class="text-muted fa fa-star"></i></li>';
//     str += "</ul>";
//     str += '<p class="text-center mb-0">' + item.price + "원</p>";
//     str += "</div>";
//     str += "</div>";
//     str += "</div>";
//   });
//   document.querySelector(".productList").innerHTML = str;
// }
