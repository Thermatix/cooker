# deal with attributes:
# node['chocolatey']['Uri'] - Defaults to "https://chocolatey.org/install.ps1".
# node['chocolatey']['upgrade'] - Defaults to "true".

module Cooker
	module Templates
		Providers[:chocolatey] = "
			<% case @data[:action %> 
			<% when 'install' %>
				chocolatey '<%= @data[:package] %>' do
					<%= \"source '#{@data[:source]}'\" if @data[:source] %>
					<%= \"args '#{@data[:args]}'\" if @data[:args] %>
				end
			<% when 'remove' %>
				chocolatey '<%= @data[:package] %>'do
					action :remove
				end
			<% when 'upgrade' %>
				chocolatey '<%= @data[:package] %>' do
					action :upgrade
				end
			<% else %>
			%w{<%= @data[:packages] %>}.each do |pack|
				chocolatey pack do
					<%= \"source '#{@data[:source]}'\" if @data[:source] %>
					<%= \"args '#{@data[:args]}'\" if @data[:args] %>
				end
			end
			<% end %>
		"
	end
end