// pivot box js

$(document).ready(function(){

	// on focusing unhide the form elements
	$('#post_title').focus(function(){
		$(this).removeClass('no_margin_strict').attr('placeholder', 'Pivot title (50 char max)');
		$('#post_hidden_form').slideDown();
	});

	$('#cancel_pivot').click(function(){
		clear_pivot_form();
	});
});

function clear_pivot_form ()
{
	$('#post_content').attr('value','');
	$('#post_hidden_form').slideUp(function(){
		$('#post_title').attr('value','').addClass('no_margin_strict').attr('placeholder','Pivot here');
	});
}