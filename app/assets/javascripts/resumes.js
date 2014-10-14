$(document).ready(function(){

	$('.edit').click(function(){
		$(this).hide();
		$(this).next().show();
		$(this).next().select();
	});

	// $('input[type="text"]').blur(function() {
	// 	if ($.trim(this.value) == ''){
	// 		this.value = (this.defaultValue ? this.defaultValue : '')
	//
	// 	}
	//
	// 	$(this).hide();
	// 	$(this).prev().show();
	// });

	$('input[type="text"]').keypress(function(event) {
		if (event.keyCode == '13') {
			if ($.trim(this.value) == ''){
				this.value = (this.defaultValue ? this.defaultValue : '');
			}
			else {
				$(this).prev().html(this.value);
				console.log($('.email').val());
				$.ajax('/resumes/master/update', {
						type: 'PUT',
						data:  {
							email: $(".email").text(),
							phone_1 : $('.phone_1').text(),
							phone_2 : $('.phone_2').text(),
							phone_3 : $('.phone_3').text(),
							address : $('.address').text(),
							city : $('.city').text(),
							state : $('.state').text(),
							postal_code : $('.postal_code').text(),
						}
				});


				$(this).hide();
				$(this).prev().show();
			};
    }



		// $(function() {
		//   $( "#draggable" ).draggable();
		// });
		//
		// $(function() {
		//   $( "#selectable" ).selectable();
		// });

	});
});
