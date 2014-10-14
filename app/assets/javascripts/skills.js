$(document).ready(function(){

  $('.add-skill').click(function(){
    // console.log($(this));
    $(this).prev().prev().prev().show();
    $(this).prev().prev().prev().select();
  });

  $('input[type="text"]').blur(function() {
    if ($.trim(this.value) == ''){
      this.value = (this.defaultValue ? this.defaultValue : '')
    }

    $(this).hide();
    $(this).prev().prev().prev().show();
  });



  $('input[type="text"]').keypress(function(event) {
    if (event.keyCode == '13') {
      $(this).prev().html(this.value);
      console.log($(this));
      $.ajax('/resumes/master/update', {
        type: 'PUT',
        data: $('.new_skill').text(),
      });
    }
    // $('td').last().append('.new_skill').text();
    $(this).prev().prev().prev().show();
  });




});
