/**
 *
 */

const createButton = document.querySelector("#createChat");

getChatRoomList();

function getChatRoomList() {
  fetch("/chatrooms/")
    .then((response) => {
      if (!response.ok) {
        throw new Error("실시간 상담 목록 요청 실패");
      }
      return response.json();
    })
    .then((data) => {
      let chatRoomList = "";
      data.forEach((chatRoom) => {
        if (chatRoom.memberId == null) {
          str = "관리자";
        } else {
          str = chatRoom.memberId;
        }
        chatRoomList += '<a href="' + chatRoom.chatRoomId + '" class="list-group-item list-group-item-action" aria-current="true">';
        chatRoomList += '<div class="d-flex w-100 justify-content-between">';
        chatRoomList += '<h5 class="mb-1">BLACKPEARL</h5>';
        chatRoomList += "<small>" + chatRoom.lastActiveTime + "</small>";
        chatRoomList += "</div>";
        chatRoomList += "<small>" + str + "</small>";
        chatRoomList += "</a>";
      });
      document.querySelector("#chatroomlist").innerHTML = chatRoomList;
    })
    .catch((error) => console.log(error));
}

createButton.addEventListener("click", () => {
  createChatRoom(csrfToken);
});

function createChatRoom(csrfToken) {
  fetch("/chatrooms/room", {
    method: "PUT",
    headers: {
      "X-CSRF-TOKEN": csrfToken,
    },
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("신규 문의 생성 실패");
      }
      return response.text();
    })
    .then((chatRoomId) => {
      enterChatRoom(chatRoomId);
    })
    .catch((error) => console.log(error));
}

function enterChatRoom(chatRoomId) {
  location.href = "/chat/room/" + chatRoomId;
}

document.querySelector("#chatroomlist").addEventListener("click", (e) => {
  e.preventDefault();
  const a = e.target.closest("a");
  enterChatRoom(a.getAttribute("href"));
});
