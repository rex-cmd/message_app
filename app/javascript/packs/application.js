// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("semantic-ui-sass");
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "jquery";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
scroll_bottom=function(){
   if($('#messages').length>0){
     $('#messages').scrollTop($('#messages')[0].scrollHeight);
   }
}
submit_message=function(){
  $('#messsage_body').on('keydown', function(e){
     if(e.key==13){
      $('button').on('click');
      e.target.value=''
     }
  })
}
$(document).on("turbolinks:load", function () {
  $(".ui.dropdown").dropdown();
  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });
 scroll_bottom();
});
