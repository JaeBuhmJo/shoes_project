const colorSelect = document.querySelector("#productColor");
const sizeSelect = document.querySelector("#productSize");

colorSelect.addEventListener("change", () => {
  const selectedColor = colorSelect.ariaValueMax;
  const sizes = getSizeForColor(selectedColor);
  // 함수를 통해 선택한 color에 해당하는 사이즈 데이터를 가져옴

  // 사이즈 옵션 업데이트
  sizeSelect.innerHTML = "";
  sizes.forEach(function (size) {
    const option = document.createElement("option");
    option.value = size;
    option.textContent = size;
    sizeSelect.appendChild(option);
  });
});

function getSizeForColor(color) {
  // 여기서 서버에서 필요한 데이터를 가져오거나, 클라이언트 측에서 가지고 있는 데이터를 활용하여 처리합니다.
  // 예를 들어, inventory 배열에서 선택한 color에 해당하는 사이즈를 필터링하고 반환할 수 있습니다.

  const inventory = [{ productColor: "red" }];
  return inventory
    .filter((item) => item.productColor === color)
    .map((item) => item.productSize);
}
