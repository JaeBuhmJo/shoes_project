/**
 *
 */

function getTimeStamp(date) {
  let now = date;
  if (date == null) {
    now = new Date();
  }
  const hours = now.getHours();
  const ampm = "";
  if (hour < 12) {
    ampm = "오전";
  } else {
    ampm = "오후";
    hour = hour - 12;
  }
  const minutes = now.getMinutes();
  const minutesStamp = minutes > 9 ? minutes : "0" + minutes;
  const timeStamp = ampm + hours + ":" + minutesStamp;
  return timeStamp;
}

document.addEventListener("DOMContentLoaded", function () {
  const msgArea = document.querySelector("#msgArea");
  const chatRoomId = document.querySelector("#chatRoomId").value;
  var username = document.querySelector("#memberId").value;

  var sockJs = new SockJS("/stomp/chat");
  var stomp = Stomp.over(sockJs);

  stomp.connect({}, function () {
    console.log("STOMP Connection");
    initialize(chatRoomId);

    stomp.subscribe("/sub/chat/room/" + chatRoomId, function (chat) {
      const content = JSON.parse(chat.body);

      const writer = content.memberId;
      const message = content.content;
      const timeStamp = getTimeStamp(null);
      const type = content.messageType;
      let str = "";
      if (type === "SYSTEM") {
        str = "<div class='col-auto d-flex flex-row'>";
        str += "<div class='alert alert-primary text-center message-alert'>";
        str += "<b>" + message + "</b>";
        str += "</div></div>";
      } else {
        if (message != "") {
          if (writer === username) {
            str = "<div class='col-auto d-flex flex-row-reverse'>";
            str += "<div class='alert alert-warning message-alert'>";
            str += "<b>" + message + "</b>";
            str += "</div>";
            str += "<span class='mx-2'>" + timeStamp + "</span>";
            str += "</div>";
          } else {
            str = writer;
            str += "<div class='col-auto d-flex flex-row'>";
            str += "<div class='alert alert-light message-alert'>";
            str += "<b>" + message + "</b>";
            str += "</div>";
            str += "<span class='mx-2'>" + timeStamp + "</span>";
            str += "</div>";
          }
        }
      }
      msgArea.insertAdjacentHTML("beforeend", str);
      msgArea.scrollTop = msgArea.scrollHeight;
    });
    stomp.send("/pub/chat/enter", {}, JSON.stringify({ chatRoomId: chatRoomId, memberId: username }));
  });

  // 실시간 상담 종료
  document.querySelector("#disconnect-btn").addEventListener("click", () => {
    if (confirm("실시간 상담을 종료하시겠습니까?")) {
      stomp.send("/pub/chat/leave", {}, JSON.stringify({ chatRoomId: chatRoomId, memberId: username }));
      location.href = "/chat/list";
    }
  });

  const textarea = document.querySelector("#msg");
  document.querySelector("#button-send").addEventListener("click", () => {
    sendMessage();
  });

  textarea.addEventListener("keydown", (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  });

  function initialize(chatRoomId) {
    fetch("/chatrooms/chat/" + chatRoomId)
      .then((response) => {
        if (!response.ok) {
          throw new Error("상담 내역 가져오기 실패");
        }
        return response.json();
      })
      .then((chat) => {
        chat.forEach((log) => {
          const writer = log.memberId;
          const message = log.content;
          const timeStamp = getTimeStamp(log.timeStamp);
          let str = "";
          if (log.messageType === "SYSTEM") {
            str = "<div class='col-auto d-flex flex-row'>";
            str += "<div class='alert alert-primary text-center message-alert'>";
            str += "<b>" + message + "</b>";
            str += "</div></div>";
          } else {
            if (message != "") {
              if (writer === username) {
                str = "<div class='col-auto d-flex flex-row-reverse'>";
                str += "<div class='alert alert-warning message-alert'>";
                str += "<b>" + message + "</b>";
                str += "</div>";
                str += "<span class='mx-2'>" + timeStamp + "</span>";
                str += "</div>";
              } else {
                str = writer;
                str += "<div class='col-auto d-flex flex-row'>";
                str += "<div class='alert alert-light message-alert'>";
                str += "<b>" + message + "</b>";
                str += "</div>";
                str += "<span class='mx-2'>" + timeStamp + "</span>";
                str += "</div>";
              }
            }
          }
          msgArea.insertAdjacentHTML("beforeend", str);
          msgArea.scrollTop = msgArea.scrollHeight;
        });
      })
      .catch((error) => console.log(error));
  }

  function sendMessage() {
    var msg = textarea;
    stomp.send(
      "/pub/chat/message",
      {},
      JSON.stringify({ chatRoomId: chatRoomId, content: msg.value, memberId: username })
    );
    msg.value = "";
  }
});
