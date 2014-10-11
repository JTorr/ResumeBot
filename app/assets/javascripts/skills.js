
$(function() {
// -- Skills -----
var skillForm = $('.add-skill-form')
  , id = skillForm.data('id');

skillForm.hide();

$('.add-skill').click(function() {
  skillForm.slideToggle();
});

skillForm.submit(function(e) {
  // Alternative to returning `false`
  e.preventDefault();

  console.log('Serialized data is', skillForm.serialize());

  $.ajax('/resumes/' + id + '/skill', {
    type: 'POST',
    data: skillForm.serialize(),
    success: function(skill) {
      console.log(skill);
      $('.skills').prepend( $( skill.name ) );
    },
    error: function(response) {
      // FIXME: get errors from response
      console.log(response);
      alert('Error was: ' + response.errors);
    }
  });

  skillForm.slideToggle();
});
