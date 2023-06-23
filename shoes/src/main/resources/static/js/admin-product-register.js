/**
 *
 */

document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/product/list";
});

const registerForm = document.querySelector("#registerForm");

registerForm.addEventListener("submit", (e) => {
  e.preventDefault();
  if (isNaN(document.querySelector("#price").value)) {
    alert("가격은 숫자만 입력해주세요");
    return;
  }
  if (isNaN(document.querySelector("#productYear").value)) {
    alert("제조 연도는 숫자만 입력해주세요");
    return;
  }
  if (document.querySelector("input[name='colorList[0]']").value == "" || document.querySelector("input[name='sizeList[0]']").value == "") {
    alert("필수 색상과 사이즈를 입력해주세요");
    return;
  }

  let str = "";
  document.querySelectorAll(".cards").forEach((card, idx) => {
    str += "<input type='hidden' name='attachmentList[" + idx + "].uuid' value='" + card.dataset.uuid + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].uploadPath' value='" + card.dataset.path + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].fileName' value='" + card.dataset.filename + "'/>";
  });
  registerForm.insertAdjacentHTML("beforeend", str);
  registerForm.submit();
});

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
  newRow += '<input type="text" name="colorList[' + colorCount + ']" class="form-control colorList" placeholder="색상">';
  newRow += "</div>";
  newRow += '<div class="col-sm-4">';
  newRow += '<input type="text" name="sizeList[' + colorCount + ']" class="form-control sizeList" placeholder="ex)260,270,280 (쉼표로 구분)">';
  newRow += "</div>";
  newRow += '<div class="col-sm-2"> ';
  newRow += '<button type="button" class="removeRow btn btn-outline-danger" tabindex="-1"><i class="fa-solid fa-xmark"></i></button>';
  newRow += "</div>";
  colorCount += 1;

  document.querySelector("#newRow").insertAdjacentHTML("beforeend", newRow);
});

// 입력칸 삭제
document.querySelector("#newRow").addEventListener("click", (e) => {
  if (e.target.matches(".removeRow") && confirm("색상 정보를 삭제하시겠습니까?")) {
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
      idx += 1;
      sizeidx += 1;
    });
    coloridx += 1;
  });
  tbody.innerHTML = tr;
});
