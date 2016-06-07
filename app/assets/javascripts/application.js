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

//show individual projects
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
//calls on employee roster
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
//ajax call to post new user
var addnewuser = function() {
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
};
//calls on list of employees
$(document).on("click", "#employees", showusers);
//option to add new employee
$(document).on("click", "#add-new-user", function() {
  var mini = $("#miniform-user");
  $(this).hide();
  $(mini).show();
});
//cancel option to add new employee
$(document).on("click", "#cancel-new-user", function() {
  var mini = $("#miniform-user");
  $(mini).hide();
  $("#add-new-user").show();
});
//submission of new employee
$(document).on("click", "#submit-new-user", addnewuser);

//ajax call of editing user model
$(document).on("click", "a.userlink-edit", function() {
  var id = $(this).attr("id")
  var row = $("tr#" + id)
  var rowclone = $(row).clone()
  var name = $("#show-users").find(row).find($("td.name")).html()
  var email = $("#show-users").find(row).find($("a.email")).html()
  var input = $('<tr><td><input class=form-control placeholder=' + name + ' id=iusername></td><td><input class=form-control placeholder=' + email + ' id=iemail></td><td><button class="btn btn-default" id="submit-edit">Submit</button></td><td></td></tr>');
  $(row).replaceWith($(input));
  $("button#submit-edit").on("click", function() {
    var username = $("#iusername").val()
    var email = $("#iemail").val();
    $.ajax({
      url: "/users/" + id,
      type: "PUT",
      dataType: "json",
      data: {
        user: {
          name: username,
          email: email
        }
      },
      success: showusers//alert("saved! please exit out of the form")//function() {$('#modal_display').modal('show')}
    });
    $(input).replaceWith($(rowclone));
  });
});
//$(document).on("dblclick", "tr.user", function() {
//  var id = $(this).attr("id")
//  var customform = $("<tr id='miniform-user-edit'" + id "><td><input class='form-control' id='input-user-name'></td><td><input class='form-control' id='input-email'></td><td><button class='btn btn-default' id='edit-user'>Submit</button></td><td></td></tr>");
//  $(this).replaceWith($(customform));
//});







