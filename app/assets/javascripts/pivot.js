// pivot box js

$(document).ready(function(){

	// on focusing unhide the form elements
	$('#post_title').focus(function(){
		$(this).removeClass('no_margin_strict').attr('placeholder', 'Pivot title (50 char max)');
		$('#post_hidden_form').show();
	});

});