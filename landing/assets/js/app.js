// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

 // WARNING: For POST requests, body is set to null by browsers.       
 let loginForm = document.getElementById("send-message");
 $('#send-success').fadeOut(1);

 loginForm.addEventListener("submit", (e) => {
     e.preventDefault();
     var settings = {
         "url": "https://us-central1-encouraging-mix-111109.cloudfunctions.net/contact_email/send-message",
         "method": "POST",
         "timeout": 0,
         "headers": {
             "Content-Type": "application/json"
         },
         "data": JSON.stringify({
             "name": document.getElementById("first-name").value,
             "email": document.getElementById("email").value,
             "phone": document.getElementById("phone").value,
             "message": "Mensaje desde la página: " + document.getElementById("comment").value +
                 "\n Nombre: " + document.getElementById("first-name").value +
                 "\n Apellido: " + document.getElementById("last-name").value +
                 "\n Email: " + document.getElementById("email").value +
                 "\n Teléfono: " + document.getElementById("phone").value,
             "token_hash": "d4cb0b2f-ef4b-478c-bca0-0b5f636f63c0"
         }),
     };
     $.ajax(settings).done(function(response) {
         console.log(response);
         $('.loading-area').fadeOut(1000);
         $('#send-success').fadeIn(1000);
         $('#first-name').val("");
         $('#last-name').val("");
         $('#phone').val("");
         $('#email').val("");
         $('#comment').val("");
     });
 });

 //end of IIFE function

