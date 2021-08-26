function question (){
  const favorite = document.getElementById("favorite");
  favorite.addEventListener("click", (e) => {
    e.preventDefault();
    const favorite = document.getElementById("form");
    const favoriteData = new FormData(favorite);
    const XHR = new XMLHttpRequest();
    var question_id = document.getElementById("hidden_id").value;
    var answer_id = document.getElementById("hidden_favorite").value;
    XHR.open("POST", "/questions/" + question_id + "/answers/" + answer_id + "/favorites " , true);
    XHR.responseType = "json";
    XHR.send(favoriteData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("add_favorite");
      const html = `あなたと`;
      list.insertAdjacentHTML("afterend", html);
    };
  });
};

window.addEventListener('load', question);