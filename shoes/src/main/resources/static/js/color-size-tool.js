/**
 *
 */

// 입력칸 추가
document.querySelector("#addRow").addEventListener("click", () => {
  if (colorCount >= 10) {
    alert("색상은 최대 10종 까지만 입력 가능합니다.");
    return;
  }
  newRow = "";
  newRow += '<div class="mb-3 row inputForm">';
  newRow += '<div class="col-sm-2">';
  newRow += "</div>";
  newRow += '<div class="col-sm-2">';
  newRow += '<input type="text" class="form-control colorList" placeholder="색상">';
  newRow += "</div>";
  newRow += '<div class="col-sm-4">';
  newRow += '<input type="text" class="form-control sizeList" placeholder="ex)260,270,280 (쉼표로 구분)">';
  newRow += "</div>";
  newRow += '<div class="col-sm-2"> ';
  newRow += '<button type="button" class="removeRow btn btn-outline-danger" tabindex="-1"><i class="fa-solid fa-xmark"></i></button>';
  newRow += "</div>";
  colorCount += 1;

  document.querySelector("#newRow").insertAdjacentHTML("beforeend", newRow);
});

// 입력칸 삭제
document.querySelector("#newRow").addEventListener("click", (e) => {
  if ((e.target.matches(".removeRow") || e.target.matches("svg") || e.target.matches("path")) && confirm("색상 정보를 삭제하시겠습니까?")) {
    e.target.closest(".inputForm").remove();
  }
});

// 재고 입력 칸 생성
const tbody = document.querySelector(".table-group-divider");
document.querySelector(".btn-success").addEventListener("click", (e) => {
  if (tbody.innerHTML != "" && !confirm("주의 : 재고 입력칸을 재생성하면 기존 재고 입력값이 사라집니다. 그래도 진행할까요?")) {
    return;
  }
  //위에서 입력된 색상 - 사이즈 별로 포문을 돌려야한다.
  const colorList = document.querySelectorAll(".colorList");
  tr = "";
  let idx = 0;

  let coloridx = 0;
  colorList.forEach((color) => {
    if (color.value == "") {
      return;
    }
    //사이즈 위의 색상 요소 가져오기
    const sizes = color.parentElement.nextElementSibling.firstElementChild;
    const sizesSplit = sizes.value.split(",");
    let sizeidx = 0;
    sizesSplit.forEach((size, sizeidx) => {
      if (size == "") {
        return;
      }
      tr += "<tr>";
      if (sizeidx == 0) {
        tr += '<th scope="row" class="text-center align-middle' + (coloridx % 2 == 0 ? " table-info " : "") + '" rowspan=' + sizesSplit.length + ">" + color.value + "</th>";
      }
      tr += "<td class='text-center align-middle" + (idx % 2 == 0 ? " table-info " : "") + "'>" + size.trim() + "</td>";
      tr += '<td><input type="text" class="form-control form-control-sm text-center align-middle" name="quantityList[' + idx + ']" value="0"/></td>';
      tr += "</tr>";
      tr += '<input type="hidden" name="colorList[' + idx + ']" value="' + color.value + '"/>';
      tr += '<input type="hidden" name="sizeList[' + idx + ']" value="' + size.trim() + '"/>';
      idx += 1;
      sizeidx += 1;
    });
    coloridx += 1;
  });
  tbody.innerHTML = tr;
});
