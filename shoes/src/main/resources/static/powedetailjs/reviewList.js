function showReviews(productId, page) {
  fetch("/shoes/review/" + productId + "/pages/" + page)
    .then((response) => {
      if (!response.ok) {
        throw Error(response.statusText);
      }

      return response.json();
    })
    .then((data) => {
      console.log("리뷰 data", data.list);
      reviewPage(data.total);
      const reviewList = document.querySelector("#reviews-list");
      var reviewHTML = "";

      data.list.forEach((item) => {
        reviewHTML += "<div class='card my-3'>";
        reviewHTML += "<div class='card-header'>";
        reviewHTML +=
          "<div class='btn-group btn-group-sm' data-rid='" +
          item.reviewId +
          "'>";
        reviewHTML +=
          "<button type='button' class='btn btn-danger' >삭제</button>";
        reviewHTML +=
          "<button type='button' class='btn btn-info'  data-bs-toggle='modal' data-bs-target='#exampleModal'>수정</button>";
        reviewHTML += "</div>";
        reviewHTML += "<strong>" + item.memberId + "</strong>";
        reviewHTML += "</div>";

        reviewHTML +=
          '<div class="rating" data-jumsu=' + item.jumsu + "></div>";
        reviewHTML += "<div class='card-body'>";

        reviewHTML += "<p class='card-text'>" + item.contents + "</p>";
        reviewHTML += "<p class='card-text text-muted'>";

        reviewHTML += "<small>" + item.regdate + "</small>";
        reviewHTML += "</p>";
        reviewHTML += "</div>";
        reviewHTML += "</div>";
      });
      reviewList.innerHTML = reviewHTML;
    })
    .catch((error) => {
      console.log(error);
    });
}

// 페이지 나누기 클릭 시
document.querySelector("#reviewPagination").addEventListener("click", (e) => {
  console.log("부모", e.currentTarget);
  console.log("이벤트 대상", e.target);

  e.preventDefault();
  e.stopPropagation();

  //href 가져오기
  //let target = e.target;

  page = e.target.getAttribute("href");

  showReviews(productId, page);
});

let page = 1;

//리뷰 리스트 가져오기
showReviews(productId, page);

function reviewPage(total) {
  //reply.js
  let realend = Math.ceil((total * 1.0) / 10);
  let endPage = Math.ceil(page / 10.0) * 10;
  let startPage = endPage - 9;
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
      '<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dart" href="' +
      (startPage - 1) +
      '">prev</a></li>';
  }
  for (let i = startPage; i <= endPage; i++) {
    let disabled = page == i ? "disabled" : "";
    let active = page == i ? "active" : "";
    let textDark = page == i ? "text-dark" : "";
    str +=
      '<li class="page-item' +
      disabled +
      '"><a class="page-link' +
      active +
      "rounded-0 shadow-sm border-top-0 border-left-0" +
      textDark +
      '"href=' +
      i +
      ">" +
      i +
      "</a></li>";
  }
  if (next) {
    str +=
      '<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-lift-0 text-dark" href=' +
      (endPage + 1) +
      ">next</a></li>";
  }
  document.querySelector("#reviewPagination").innerHTML = str;
}

//리뷰 삭제
document.querySelector("#reviews-list").addEventListener("click", (e) => {
  //버튼의 속해 있는 댓글 rid 가져오기
  const reviewId = e.target.closest("div").dataset.rid;

  //삭제 or 수정인지 구분
  if (e.target.classList.contains("btn-danger")) {
    fetch("/shoes/" + reviewId, {
      headers: {
        "X-CSRF-TOKEN": csrfToken,
        "Content-Type": "application/json",
      },
      method: "delete",
      body: JSON.stringify({
        memberId: memberId,
      }),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("삭제 실패");
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
        showReviews(productId, page);
      })
      .catch((error) => console.log(error));
  } else {
    const contents = document.querySelector("#contents").value;
    fetch("/shoes/get/" + reviewId)
      .then((response) => {
        if (!response.ok) {
          throw new Error("수정 페이지 가기 실패");
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);

        //수정폼에 보여주기
        showModal(data);
      })
      .catch((error) => console.log(error));
  }
});

function showModal(data) {
  const exampleModal = document.getElementById("exampleModal");
  if (exampleModal) {
    exampleModal.addEventListener("show.bs.modal", (event) => {
      // Update the modal's content.
      const contents = exampleModal.querySelector(".modal-body input");

      modalBodyInput.value = data.contents;
      const memberId = data.memberId;
      const reviewId = data.reviewId;
    });
    exampleModal
      .querySelector("#reviewUpdate")
      .addEventListener("click", (e) => {
        e.preventDefault();

        const contents = document.querySelector("#contents").value;
        const memberId = data.memberId;
        const reviewId = data.reviewId;
        fetch("/shoes/get/" + reviewId, {
          headers: {
            "X-CSRF-TOKEN": csrfToken,
            "Content-Type": "application/json",
          },
          method: "put",
          body: JSON.stringify({
            memberId: memberId,
            contents: contents,
            reviewId: reviewId,
          }),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("리뷰 수정 실패");
            }
            return response.json();
          })
          .then((data) => {
            console.log(data);
            showReviews(productId, page); //수정 후 리뷰 목록 새로 고침
          })
          .catch((error) => console.log(error));
      });
  }
}
// // 리뷰 수정 버튼이 클릭되면
// document.querySelector("").addEventListener((e) => {
//   // 내용 수정
//   // fetch + put mapping

//   // 수정 성공 시
//   showReviews(productId, page);
// });
