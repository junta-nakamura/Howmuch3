// function post (){
//   const submit = document.getElementById("submit-message");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();
//     const form = document.getElementById("form");
//     const formData = new FormData(form);
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "/rooms/${params[@room.id]}/messages", true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//     XHR.onload = () => {
//       console.log(XHR.response);
//     };
//   });
// }

// window.addEventListener('load', post);