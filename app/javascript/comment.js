const buildHTML = (XHR) => {
  const item = XHR.response.comment;
  const html = `
    <div class="comment">
      <div class="pt-4">
        <div class="pb-2">
          <dt>${hidden_name.value}さん</dt><br>
        </div>
        <div class="textarea">
          ${item.text}
        </div>
        <hr>
      </div>
    </div>`;
  return html;
};
function question (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    var question_id = document.getElementById("hidden_like").value;
    
    XHR.open("POST", "/questions/" + question_id + "/comments " , true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
};

window.addEventListener('load', question);