function getSizes() {
  var colorSelect = document.querySelector("#productColor");
  var selectedColor = colorSelect.value;

  //색이 선택되었다면 url에 있는 productId의 값을 가져오고
  if (selectedColor !== "색상선택") {
    var urlParams = new URLSearchParams(window.location.search);
    var productId = urlParams.get("productId"); //productId 값 설정 필요

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
        updateSizeOptions(data);
        if (data.length > 0) {
          document.querySelector("#productSize").disabled = false;
        } else {
          document.querySelector("#productSize").disabled = true;
        }
      })
      .catch((error) => console.error(error));
  } else {
    updateSizeOptions([]);
    document.querySelector("#productSize").disabled = true;
  }
}

document.querySelector("#productColor").addEventListener("change", getSizes);

function updateSizeOptions(sizes) {
  var sizeSelect = document.querySelector("#productSize");
  sizeSelect.innerHTML = "";

  // while (sizeSelect.firstChild) {
  //   sizeSelect.removeChild(sizeSelect.firstChild);
  // }
  if (sizes.length > 0) {
    sizes.forEach(function (size) {
      var option = document.createElement("option");
      option.value = size.productSize;
      option.textContent = size.productSize;
      sizeSelect.appendChild(option);
    });
    sizeSelect.style.visibility = "visible";
  } else {
    sizeSelect.style.visibility = "hidden";
  }
}

