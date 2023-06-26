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
      detailForm.submit();
    })
    .catch((error) => console.log(error));
});

<ul class="list-inline pb-3" id="detailsize">
										<li class="list-inline-item">Size : </li>
										<select class="form-select" aria-label="" name="productSize" id="productSize">
										  <option selected>사이즈 선택</option>
										  <option value="200">200</option>
										  <option value="210">210</option>
										  <option value="220">220</option>
										  <option value="230">230</option>
										  <option value="240">240</option>
										  <option value="250">250</option>
										  <option value="260">260</option>
										  <option value="270">270</option>
										  <option value="280">280</option>
										</select>										
									<input class="form-control me-2" id="cartAmount" name="cartAmount" 
									type="search" placeholder="수량 입력" aria-label="Search">																
							</ul>