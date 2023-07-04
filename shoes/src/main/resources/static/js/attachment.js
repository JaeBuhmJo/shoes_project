/**
 *
 */

const attachment = document.querySelector("#attachment");

//파일 첨부 변경 시 파일명 오름차순으로 정렬, 첨부 파일 put
if (attachment) {
  attachment.addEventListener("change", () => {
    const formData = new FormData();

    const fileList = Array.from(attachment.files);
    fileList.sort((a, b) => {
      return a.name.localeCompare(b.name);
    });
    fileList.forEach((file) => {
      formData.append("attachment", file);
    });

    fetch("/attachment", {
      method: "put",
      headers: {
        "X-CSRF-TOKEN": csrfToken,
      },
      body: formData,
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("파일 업로드 실패");
        }
        return response.json();
      })
      .then((data) => {
        showAttachments(data);
      })
      .catch((error) => console.log(error));
  });
}

// 정보 수정 페이지인경우 productId 기준으로 첨부파일 불러오기
if (pageIsRead) {
  fetch("/attachment/" + productId)
    .then((response) => {
      if (!response.ok) {
        throw new Error("첨부 파일이 없습니다.");
      }
      return response.json();
    })
    .then((data) => {
      showAttachments(data);
    })
    .catch((error) => console.log(error));
}

function showAttachments(attachmentList) {
  let str = "";
  attachmentList.forEach((item, idx) => {
    let fileCallPath = encodeURIComponent(item.uploadPath + "\\thumb_" + item.uuid + "_" + item.fileName);
    str += '<div class="col cards" data-path="' + item.uploadPath + '" data-uuid="' + item.uuid + '" data-filename="' + item.fileName + '">';
    str += '<div class="card col" style="width: 10rem;">';
    str += '<img src="/attachment/file?fileName=' + fileCallPath + '" class="card-img-top">';
    str += '<div class="card-body">';
    str += '<p class="card-text">' + item.fileName + "</p>";
    str += '<button type="button" class="btn btn-sm btn-circle btn-outline-danger delete-button" data-file="' + fileCallPath + '"data-type="file"><i class="fa-solid fa-xmark"></i></button>';
    str += "</div>";
    str += "</div>";
    str += "</div>";
  });
  document.querySelector(".attachmentResult").insertAdjacentHTML("beforeend", str);
}

// x버튼 클릭 시 카드 삭제
if (document.querySelector(".attachmentResult")) {
  document.querySelector(".attachmentResult").addEventListener("click", (e) => {
    if (e.target.tagName === "BUTTON" || e.target.matches("svg") || e.target.matches("path")) {
      const targetFile = e.target.dataset.file;
      const cards = e.target.closest(".cards");

      if (confirm("정말로 파일을 삭제하시겠습니까?")) {
        const formData = new FormData();
        formData.append("fileName", targetFile);

        fetch("/attachment", {
          method: "delete",
          headers: {
            "X-CSRF-TOKEN": csrfToken,
          },
          body: formData,
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("파일 제거 실패");
            }
            return response.text();
          })
          .then((data) => {
            cards.remove();
          })
          .catch((error) => console.log(error));
      }
    }
  });
}
