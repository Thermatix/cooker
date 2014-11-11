module Cooker
	module Templates
		Providers[:gem_package] = "
		gem_package '<%= @data[:name] %>' do
		<% (@data[:args] || @data[:arguments] ).each do |key, value| %>
			<% if key != 'options' %>
		 	<%= \"#{key} '#{value}'\" %>
		 	<% else %>
		 	options	(<%= value.each { |option| puts \":#{option} => true,\"}%>)
		 	<% end %>
		<% end %>
		end
		"

	end
end



 
