function getSizes() {
  var colorSelect = document.querySelector("#productColor");
  var selectedColor = colorSelect.value;

  if (selectedColor !== "색상선택") {
    var urlParams = new URLSearchParams(window.location.search);
    var productId = urlParams.get("productId"); //productId 값 설정 필요

    fetch(
      "/size?productId=${encodeURIComponent(productId)}&productColor=${encodeURIComponent(selectedColor)}"
    )
      .then((response) => response.json())
      .then((data) => updateSizeOptions(data))
      .catch((error) => console.error(error));
  } else {
    updateSizeOptions([]);
  }
}

function updateSizeOptions(sizes) {
  var sizeSelect = document.querySelector("#productSize");

  while (sizeSelect.firstChild) {
    sizeSelect.removeChild(sizeSelect.firstChild);
  }
  if (sizes.length > 0) {
    sizes.forEach(function (size) {
      var option = document.createElement("option");
      option.value = size;
      option.textContent = size;
      sizeSelect.appendChild(option);
    });
    sizeSelect.style.visibility = "visible";
  } else {
    sizeSelect.style.visibility = "hidden";
  }
}
