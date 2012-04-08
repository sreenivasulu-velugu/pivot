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

end
