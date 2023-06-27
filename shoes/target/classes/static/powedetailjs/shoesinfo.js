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
      .then((data) => {
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

function updateSizeOptions(sizes) {
  var sizeSelect = document.querySelector("#productSize");

  while (sizeSelect.firstChild) {
    sizeSelect.removeChild(sizeSelect.firstChild);
  }
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
// function getsize() {
//   var colorSelect = document.querySelector("#productColor");
//   var selectedColor = colorSelect.value;

//   if (selectedColor !== "색상선택") {
//     var sizeSelect = document.querySelector("#productSize");
//     var sizeptions = sizeSelect.querySelectorAll("option");

//     sizeOptions.forEach(function (option) {
//       if (option.value === selectedColor) {
//         option.style.display = "block";
//       } else {
//         option.style.display = "none";
//       }
//     });
//     sizeSelect.style.visibility = "visible";
//   } else {
//     updateSizeOptions([]);
//   }
// }
