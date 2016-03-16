// django crfs question solution
$.ajaxSetup({
     beforeSend: function(xhr, settings) {
         function getCookie(name) {
             var cookieValue = null;
             if (document.cookie && document.cookie != '') {
                 var cookies = document.cookie.split(';');
                 for (var i = 0; i < cookies.length; i++) {
                     var cookie = jQuery.trim(cookies[i]);
                     // Does this cookie string begin with the name we want?
                     if (cookie.substring(0, name.length + 1) == (name + '=')) {
                         cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                         break;
                     }
                 }
             }
             return cookieValue;
         }
         if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
             // Only send the token to relative URLs i.e. locally.
             xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
         }
     }
});

// make a game to star
$(".star").click(function() {
  $.post("/app/star/", {"g_id": this.id}, function(result) {
    var d = $.parseJSON(result);
    alert(d['msg']);
    if(d['error'] == 0)window.location.reload();
	});
});

// make a game to unstar
$(".unstar").click(function() {
  $.post("/app/unstar/", {"g_id": this.id}, function(result) {
    var d = $.parseJSON(result);
    alert(d['msg']);
    window.location.reload();
	});
});
