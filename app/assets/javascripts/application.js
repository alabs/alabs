// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.phono
//= require_tree .

$(document).ready(function() {

  // para el click2call
  var phono = $.phono({
    apiKey: "60d309ac89b78f74a49955d8ba3a9d6f",
    onReady: function() {
      $("#call").attr("disabled", false).val("Llamar a aLabs");
    }
  });

  $("#call").click(function() {
    $("#call").attr("disabled", true).val("Llamada en curso");
    //phono.phone.dial("sip:917714052@alabs.es:5070", {
    phono.phone.dial("sip:2000@alabs.es:5070", {
      onRing: function() {
        $("#status").html("Llamando");
      },
      onAnswer: function() {
        $("#status").html("Hablando");
      },
      onHangup: function() {
        $("#call").attr("disabled", false).val("Llamar a aLabs");
        $("#status").html("Colgar");
      }
    });
  });
});
