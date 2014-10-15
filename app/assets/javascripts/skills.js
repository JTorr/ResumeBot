$(document).ready(function(){

  $('.add-skill').click(function(){
    // console.log($(this));
    $(this).prev().prev().prev().show();
    $(this).prev().prev().prev().select();
  });

  $('input[type="text"].new_skill').blur(function() {
    if ($.trim(this.value) == ''){
      this.value = (this.defaultValue ? this.defaultValue : '')
    }

    console.log($(this));
    $(this).hide();
    $(this).prev().prev().prev().show();
  });



  $('input[type="text"].new_skill').keypress(function(event) {
    if (event.keyCode == '13') {
      $(this).prev().html(this.value);
      console.log($(this));
      $.ajax('/skills/new', {
        type: 'PUT',
        data:  {
          name: $('.new_skill').text(),
        }
      });
    }
    // $('td').last().append('.new_skill').text();
    $(this).prev().prev().prev().show();
  });




});
