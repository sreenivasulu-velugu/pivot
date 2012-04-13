module ApplicationHelper

	def beautify_params key, value = nil, key_width = 200
		if value
			contents = content_tag(
					'b', key, :class => 'pull-left', :style => "width:#{key_width}px;"
				) + content_tag(
					'div', value, :class => 'light_text', :style => "margin-left:#{key_width+10}px;"
				)
			
			return content_tag( 
				'div', contents, :class => 'beautify_params'
			)
		end
	end

	def image_radius size = 5
		return "-webkit-border-radius: #{size}px;	-moz-border-radius: #{size}px; border-radius: #{size}px;"
	end

	def link_user user = nil, opts = {}
		if user
			link_to user.name, user_path(user.id), opts
		end
	end

	def user_image user, width = nil
		if user
			if user.image_url
				image_tag user.image_url, :width => width.presence ? "#{width}px" : "100px", :style => "#{ image_radius 10 }"
			else
				image_tag 'profile_pic.png', :width => width.presence ? "#{width}px" : "100px", :style => "#{ image_radius 10 }"
			end
	end
end

	def open_doc_url(field)
		if Rails.env.production?
			url = "http://#{request.host}#{field}"
		else  
		  url = "http://#{request.host}:#{request.port}#{field}"
		end
	end  

end
