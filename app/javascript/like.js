function question (){
  const like = document.getElementById("like");
  like.addEventListener("click", (e) => {
    e.preventDefault();
    const like = document.getElementById("form");
    const likeData = new FormData(like);
    const XHR = new XMLHttpRequest();
    var question_id = document.getElementById("hidden_like").value;
    XHR.open("POST", "/questions/" + question_id + "/likes " , true);
    XHR.responseType = "json";
    XHR.send(likeData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("add_like");
      const html = `あなたと他`;
      list.insertAdjacentHTML("afterend", html);
    };
  });
};

window.addEventListener('load', question);