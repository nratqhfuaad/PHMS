$(document).ready(function () {
    $("#signup").click(function () {
      $(".signup").addClass("active");
      $(".login").removeClass("active");
    });
    $("#login").click(function () {
      $(".login").addClass("active");
      $(".signup").removeClass("active");
    });
  });