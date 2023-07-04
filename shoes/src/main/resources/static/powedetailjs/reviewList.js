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
          "<button type='button' class='btn btn-danger'>삭제</button>";
        reviewHTML +=
          "<button type='button' class='btn btn-warning'>수정</button>";
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
    let backgroundColor = page == i ? "bg-info" : "";
    let borderRadius = "rounded-pill";
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
        return response.text();
      })
      .then((data) => {
        console.log(data);

        if (data == "success") {
          alert("삭제가 되었습니다.");
        }

        showReviews(productId, page);
      })
      .catch((error) => console.log(error));
  } else {
    fetch("/shoes/review/" + reviewId)
      .then((response) => {
        if (!response.ok) {
          throw new Error("수정 페이지 가기 실패");
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);

        if (data != null) {
          const exampleModal = document.querySelector("#exampleModal");
          exampleModal.addEventListener("show.bs.modal", (event) => {
            // 모달 창에 내용 보여주기 요소 가져오기
            const contents = exampleModal.querySelector(
              ".modal-body #contents"
            );
            const memberId = exampleModal.querySelector(
              ".modal-body #memberId"
            );
            const reviewId = exampleModal.querySelector(
              ".modal-body #reviewId"
            );
            contents.value = data.contents;
            memberId.value = data.memberId;
            reviewId.value = data.reviewId;
          });
        }

        document.querySelector("#modalshow").click();
      })
      .catch((error) => console.log(error));
  }
});

// 리뷰 수정 버튼이 클릭되면
exampleModal.querySelector("#reviewUpdate").addEventListener("click", () => {
  // 내용 수정
  // 모달 내용 가져오기
  const contents = document.querySelector(".modal-body #contents").value;
  const reviewId = document.querySelector(".modal-body #reviewId").value;
  const memberId = document.querySelector(".modal-body #memberId").value;

  //리뷰 수정
  fetch("/shoes/review/" + reviewId, {
    headers: {
      "X-CSRF-TOKEN": csrfToken,
      "Content-Type": "application/json",
    },
    method: "put",
    body: JSON.stringify({
      contents: contents,
      reviewId: reviewId,
      memberId: memberId,
    }),
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("리뷰 수정 실패");
      }
      return response.text();
    })
    .then((data) => {
      console.log(data);

      if (data == "success") {
        //alert("수정 되었습니다.");

        document.querySelector(".modal-header .btn-close").click();
      }

      showReviews(productId, page); //수정 후 리뷰 목록 새로 고침
    })
    .catch((error) => console.log(error));

  // fetch + put mapping

  // 수정 성공 시
  showReviews(productId, page);
});
