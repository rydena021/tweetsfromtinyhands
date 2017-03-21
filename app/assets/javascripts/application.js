//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require_tree .



// jQuery materialize plugins
$(document).ready(function(){
    $('.parallax').parallax();
});

$(document).ready(function() {
    $('select').material_select();
});

$( document ).ready(function(){
    $(".dropdown-button").dropdown();
});

$( document ).ready(function(){
    $(".button-collapse").sideNav();
});
