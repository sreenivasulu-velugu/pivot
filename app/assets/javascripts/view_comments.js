// view comments scripts

$(document).ready(function(){
	
	// viewing
	$('.view_comments').click(function(){
		// alert("Asd");
		var postId = $(this).attr('post_id');
		$('#comments_'+postId).slideDown();
		return false;
	});

	// hiding
	$('.hide_comments').click(function(){
		var postId = $(this).attr('post_id');
		$('#comments_'+postId).slideUp();
		return false;
	});
});