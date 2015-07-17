$(document).ready(function(){


   var counter = 0; 
   setInterval(1000, function(){ counter ++ });
   setTimeout(1000, function(){ counter ++ });



   $('#card_number').on('keyup', function(){
      var firstDigit = $('#card_number').val()[0]
      if (!(firstDigit == '3' || firstDigit == '4' || firstDigit == '5')){
         $('#card_number').empty()
         $('#client-side-error').text('Invalid first nunmber')
      }
   });

  $('.delete-card').on('ajax:complete', function(e){
    $(e.currentTarget).parent().fadeOut();
  });

   // $('#new_card').on('submit', function(){
   //    return false;
   // });


});

