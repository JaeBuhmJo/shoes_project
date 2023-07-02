function changePage(event, page, productId) {
  event.preventDefault();
  fetch(
    `http://localhost:8080/shoes/detail?productId=${productId}&page=${page}`,
    {
      method: "GET",
    }
  )
    .then((response) => {
      if (!response.ok) {
        throw Error(response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      updateReviews(data);
    })
    .catch((error) => {
      console.log(error);
    });
  return false;
}

// function updateReviews(reviewsData) {
//   // 현재 목록을 지우기
//   $("#reviews-list").empty();

//   //새로운 구매 후기 목록을 추가
//   $.each(reviewsData, function (index, review) {
//     var reviewHTML = "";
//     reviewHTML += "<div class='card my-3'>";
//     reviewHTML += "<div class='card-header'>";
//     reviewHTML += `<strong>${review.memberId}</strong>`;
//     reviewHTML += "</div>";
//     reviewHTML += `<div class='rating' data-jumsu="${review.jumsu}"></div>`;
//     reviewHTML += "<div class='card-body'>";
//     reviewHTML += `<p class='card-text'>${review.contents}</p>`;
//     reviewHTML += "<p class='card-text text-muted'>";
//     reviewHTML += `<small>${review.regdate}</small>`;
//     reviewHTML += "</p>";
//     reviewHTML += "</div>";
//     reviewHTML += "</div>";
//     $("#reviews-list").append(reviewHTML);
//   });
// }
