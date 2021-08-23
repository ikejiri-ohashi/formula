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
  });
};

window.addEventListener('load', question);