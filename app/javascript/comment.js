function question (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/questions/:question_id/comments " , true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const item = XHR.response.comment;
      const html = `
        <div class="comment">
          <div class="comment-content">
            ${item.text}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', question);