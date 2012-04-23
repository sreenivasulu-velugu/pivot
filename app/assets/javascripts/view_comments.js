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

	$('.file_comments').click(function(){
		//alert("Asd");
		var postId = $(this).attr('post_id');
		$('#file_'+postId).slideDown();
		return false;
	});

// hiding
	$('.hide_file_comments').click(function(){
		var postId = $(this).attr('post_id');
		$('#file_'+postId).slideUp();
		return false;
	});

	$('.upload_file_comments').click(function(){
		//alert("Asd");
		var postId = $(this).attr('post_id');
		$('#upload_file_'+postId).slideDown();
		return false;
	});
	

	$('.upload_faq_comments').click(function(){
		//alert("Asd");
		var postId = $(this).attr('post_id');
		$('#upload_faq_'+postId).slideDown();
		return false;
	});

	$('.upload_link_url_comments').click(function(){
		//alert("Asd");
		var postId = $(this).attr('post_id');
		$('#link_url_file_'+postId).slideDown();
		return false;
	});

	

// hiding
	$('.hide_file_comments').click(function(){
		var postId = $(this).attr('post_id');
		$('#file_'+postId).slideUp();
		return false;
	});

});

