// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap/modal
//= require_tree .


var showusers = function() {
  $.ajax({
    url: "/projects/index_users",
    type: "GET",
    success: function(data) {
      $("#tag-ii").html(data);
      $('#modal_display').modal('show');
    }
  });
};

$(document).on("click", ".panel.panel-default", function() {
  var project_id = $(this).attr('data-id');
  $.ajax({
  	url: "/projects/" + project_id,
    type: "GET",
    data: { "id" : project_id },
    success: function(data) {
      $("#tag").html(data);
      $('#modal_form').modal('show');	
    }
  });
});

$(document).on("click", "#employees", showusers);

$(document).on("click", "#add-new-user", function() {
  var mini = $("#miniform-new-user");
  $(this).hide();
  $(mini).show();
});


$(document).on("click", "#submit-new-user", function() {
  var username = $("#input-user-name").val()
  var email = $("#input-email").val()
  var addnewuser = $('add-new-user');
  $.ajax({
    url: "/users",
    type: "POST",
    dataType: "json",
    data: {
      user: {
        name: username,
        email: email
      }
    },
    success: showusers
  }); 
});








