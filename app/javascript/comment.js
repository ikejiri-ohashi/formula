function question (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", () => {
    const form = document.getElementById("form-control");
    const formData = new FormData(form);
  });
};

window.addEventListener('load', question);