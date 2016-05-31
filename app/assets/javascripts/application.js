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

//Incomplete modal
//$(document).on("click", "#project_box_a", function(e) {
//  $('#modal_form').modal('show');
//});

//Wanted to see if application.js can have two document calls - and yes it can
//$(document).on("click", "#ggg", function(e) {
//  $('#trial').hide();
//});

//var projectids = [1,6];

//$.each(projectids, function(index,value) {
//  $(document).on("click", "#project_box_a" + value, function(e) {
//    $.ajax({
//      url: "/projects/" + value,
//      success: function(data) {
//        $('#modal_form').modal('show');
//        $("#tag").html("<%= j render('show') %>");                      
//        //alert(value);
//      }
//    });
//  });
//});







//$('#vote_<%= @review.id %>').html("<%= escape_javascript render :partial => 'votes/vote' %>");