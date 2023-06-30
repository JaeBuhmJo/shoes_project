function getSizes() {
  var colorSelect = document.querySelector("#productColor");
  var selectedColor = colorSelect.value;

  //색이 선택되었다면 url에 있는 productId의 값을 가져오고
  if (selectedColor !== "색상선택") {
    // size를 가져오기위함의 url을 만들어서 shoes/size 컨트롤러에서 responseBody어노테이션을 통해
    // productId와 productColor이 일치하는 size를 가져오게 만들어서 color가 바뀔 때마다 size도 바뀌어서 가져온다
    var url =
      "/shoes/size?productId=" +
      encodeURIComponent(productId) +
      "&productColor=" +
      encodeURIComponent(selectedColor);

    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        console.log("size", data);
        //사이즈를 화면에 출력하기 위한 함수 호출
        updateSizeOptions(data);
      })
      .catch((error) => console.error(error));
  }
}

//색상 변화가 일어나는 경우
document.querySelector("#productColor").addEventListener("change", getSizes);

function updateSizeOptions(sizes) {
  var sizeSelect = document.querySelector("#productSize");
  sizeSelect.innerHTML = "";

  if (sizes.length > 0) {
    var option = document.createElement("option");
    option.value = "----";
    option.textContent = "사이즈를 선택해 주세요";
    sizeSelect.appendChild(option);

    sizes.forEach(function (size) {
      option = document.createElement("option");
      option.value = size.productSize;
      option.textContent = size.productSize;
      sizeSelect.appendChild(option);
    });

    document.querySelector("#detailSize").style.display = "block";
  }
}

//사이즈에 변화가 일어나면 상품번호,색상,사이즈를 보내서 재고아이디 가져오기

//size에 변경 이벤트가 일어나면
const productSize = document.querySelector("#productSize");
const cartAmount = document.getElementById("cartAmount");

productSize.addEventListener("change", (e) => {
  const productSize = e.target.value;
  const productColor = document.getElementById("productColor").value;

  fetch(
    `/shoes/getInventoryId?productId=${productId}&productSize=${productSize}&productColor=${productColor}`
  )
    .then((response) => response.json())
    .then((data) => {
      console.log(data);

      //도착한 재고 아이디를 전송 폼 안에 넣기
      document.querySelector("#inventoryId").value = data;

      //수량 입력 요소를 보이게 하기
      cartAmount.classList.remove("hidden");
    });
});
