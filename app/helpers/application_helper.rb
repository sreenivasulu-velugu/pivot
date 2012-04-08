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

end
