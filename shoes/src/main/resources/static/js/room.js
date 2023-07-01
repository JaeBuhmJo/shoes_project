/**
 *
 */

document.addEventListener("DOMContentLoaded", function () {
  const chatRoomId = document.querySelector("#chatRoomId").value;
  var username = document.querySelector("#memberId").value;

  console.log(chatRoomId + ", " + username);

  var sockJs = new SockJS("/stomp/chat");
  var stomp = Stomp.over(sockJs);

  stomp.connect({}, function () {
    console.log("STOMP Connection");

    stomp.subscribe("/sub/chat/room/" + chatRoomId, function (chat) {
      console.log(chat.body);
      var content = JSON.parse(chat.body);

      var writer = content.memberId;
      var message = content.content;
      const type = content.messageType;
      var str = "";
      if (type === "SYSTEM") {
        str = "<div class='col-6'>";
        str += "<div class='alert alert-primary text-center message-alert'>";
        str += "<b>" + message + "</b>";
        str += "</div></div>";
      } else {
        if (message != "") {
          if (writer === username) {
            str = "<div class='col-6'>";
            str += "<div class='alert alert-secondary text-end message-alert'>";
            str += "<b>" + message + "</b>";
            str += "</div></div>";
          } else {
            str = "<div class='col-6'>";
            str += "<div class='alert alert-warning message-alert'>";
            str += "<b>" + writer + " : " + message + "</b>";
            str += "</div></div>";
          }
        }
      }
      document.querySelector("#msgArea").insertAdjacentHTML("beforeend", str);
    });

    // stomp.send("/pub/chat/enter", {}, JSON.stringify({ chatRoomId: chatRoomId, memberId: username }));
  });

  // 실시간 상담 종료
  document.querySelector("#disconnect-btn").addEventListener("click", () => {
    if (confirm("실시간 상담을 종료하시겠습니까?")) {
      stomp.send("/pub/chat/leave", {}, JSON.stringify({ chatRoomId: chatRoomId, memberId: username }));
      location.href = "/chat/list";
    }
  });

  var buttonSend = document.querySelector("#button-send");
  buttonSend.addEventListener("click", function (e) {
    var msg = document.querySelector("#msg");
    console.log(username + ":" + msg.value);
    stomp.send("/pub/chat/message", {}, JSON.stringify({ chatRoomId: chatRoomId, content: msg.value, memberId: username }));
    msg.value = "";
  });
});
