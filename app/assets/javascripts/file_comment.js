// This code is for the file uploads in the comment section (for toggling the type of upload)

$(document).ready(function(){
	
	$('.toggle_type').click(function(){
		var post_id = $(this).attr('id');
		var toggle_id = $(this).find("input").attr('id');
		if (toggle_id.match("show_file") == "show_file" || toggle_id.match("show_faq") == "show_faq")
		{
			$('#link_upload_'+post_id).hide();
			$('#file_upload_'+post_id).show();

			//clearing form values
			$('#link_upload_'+post_id).find('input').attr('value', '');
		}
		else
		{
			$('#file_upload_'+post_id).hide();
			$('#link_upload_'+post_id).show();
			
			//clearing form values
			$('#file_upload_'+post_id).find('input').attr('value', '');
		}
	});

});