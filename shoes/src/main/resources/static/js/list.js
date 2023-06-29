/**
 *
 */

const operForm = document.querySelector("#operForm");

//json stringify로 세션스토리지 저장

//json parse로 활용값으로 변환

let cri = {
  page: 1,
  listAmount: 15,
  searchType: "",
  keyword: "",
  order: "registered-date-desc",
  category: "",
  gender: "",
};

document.querySelector("#shopPagination").addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    cri.page = e.target.getAttribute("href");
    getList(cri);
  }
});

const listAmount = document.querySelector("#listAmount");
listAmount.addEventListener("change", () => {
  if (listAmount.value == 15) {
    cri.page = cri.page * 2 - 1;
  } else if (listAmount.value == 30) {
    cri.page = Math.floor((cri.page - 1) / 2) + 1;
  }
  cri.listAmount = listAmount.value;
  getList(cri);
});

const order = document.querySelector("#order");
order.addEventListener("change", () => {
  cri.page.value = 1;
  cri.order = order.value;
  getList(cri);
});

const gender = document.querySelector("#gender");
gender.addEventListener("click", (e) => {
  if (e.target.tagName === "INPUT") {
    cri.page = 1;
    cri.gender = e.target.value;

    getList(cri);
  }
});

const category = document.querySelector("#category");
category.addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    cri.page = 1;
    cri.category = e.target.getAttribute("href");
    getList(cri);
  }
});

//상품 카드 클릭 시 상세정보 페이지로 이동
const productList = document.querySelector(".productList");
productList.addEventListener("click", (e) => {
  let target = e.target;

  while (target !== productList) {
    if (target.matches(".productCard")) {
      const productId = target.getAttribute("data-productId");
      location.href = "/shoes/detail?productId=" + productId;
    }
    target = target.parentElement;
  }
});

//상품 목록 가져오기
function getList(cri) {
  fetch("/shop/list", {
    method: "POST",
    headers: {
      "X-CSRF-TOKEN": csrfToken,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(cri),
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("리스트 불러오기 실패");
      }
      return response.json();
    })
    .then((data) => {
      const productList = document.querySelector(".productList");
      let products = "";
      data.productDTOs.forEach((item) => {
        products += '<div class="col-md-4 productCard" data-productId ="' + item.productId + '">';
        products += '<div class="card mb-4 product-wap rounded-0">';
        products += '<div class="card rounded-0 image-wrapper">';
        products += '<img class="card-img rounded-0 img-fluid" src="/attachment/file?fileName=' + item.filePath + '">';
        products +=
          '<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">';
        products += "</div>";
        products += "</div>";
        products += '<div class="card-body">';
        products += '<a href="shop-single.html" class="h3 text-decoration-none">' + item.productName + "</a>";
        products += '<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">';
        products += '<li class="text-secondary"><small>' + item.colors + "</small></li>";
        products +=
          '<li class="pt-2"><span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span></li>';
        products += "</ul>";
        products += '<ul class="list-unstyled d-flex justify-content-center mb-1">';
        products +=
          '<li><i class="text-warning fa fa-star"></i> <i class="text-warning fa fa-star"></i> <i class="text-warning fa fa-star"></i> <i class="text-muted fa fa-star"></i> <i class="text-muted fa fa-star"></i></li>';
        products += "</ul>";
        products += '<p class="text-center mb-0">' + item.price + "원</p>";
        products += "</div>";
        products += "</div>";
        products += "</div> ";
      });
      productList.innerHTML = products;
      showProductPage(data.totalCount);
    })
    .catch((error) => console.log(error));
}
getList(cri);

function showProductPage(total) {
  let realend = Math.ceil((total * 1.0) / cri.listAmount);
  let endPage = Math.ceil(cri.page / 5.0) * 5;
  let startPage = endPage - 4;
  let prev = startPage != 1;
  let next = false;

  if (endPage > realend) {
    endPage = realend;
  }
  if (endPage < realend) {
    next = true;
  }

  let str = "";
  if (prev) {
    str +=
      '<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="' +
      (startPage - 1) +
      '">prev</a></li>';
  }
  for (let i = startPage; i <= endPage; i++) {
    let disabled = cri.page == i ? "disabled" : "";
    let active = cri.page == i ? "active" : "";
    let textDark = cri.page == i ? "text-dark" : "";
    str +=
      '<li class="page-item ' +
      disabled +
      '"><a class="page-link ' +
      active +
      " rounded-0 shadow-sm border-top-0 border-left-0 " +
      textDark +
      '" href=' +
      i +
      ">" +
      i +
      "</a></li>";
  }

  if (next) {
    str +=
      '<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href=' +
      (endPage + 1) +
      ">next</a></li>";
  }
  document.querySelector("#shopPagination").innerHTML = str;
}
