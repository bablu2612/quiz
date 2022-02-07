$(document).ready(function() {
    function dateTime() {
      var ndate = new Date();
      var hours = ndate.getHours();
      var message = hours < 12 ? 'Good Morning' : hours < 16 ? 'Good Afternoon' : 'Good Evening';
      $("span.day-message").text(message);
  
      $('.date').html(hours.leadingZeroes(2) + ":" + ndate.getMinutes().leadingZeroes(2) + ":" + ndate.getSeconds().leadingZeroes(2) + (hours < 12 ? 'AM' : 'PM'));
    }
  
    setInterval(dateTime, 1000);
  });

  $(".side-nav-button").on("click",function(){
    $(".side-nav,.background-side-nav").toggle();
  })
  
  Number.prototype.leadingZeroes = function(len) {
    return (new Array(len).fill('0', 0).join('') + this).slice(-Math.abs(len));
  }