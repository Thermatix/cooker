module Cooker
	module Templates
		Meta_Data = { 
			name: 'meta_data',
			path: 'meta_data.rb',
			template: "
				name             '<%= @data[:name] %>'
				maintainer       '<%= @data[:maintainer]%>'
				maintainer_email '<%= @data[:email] %>'
				license          '<%= @data[:licence] %>'
				description      '<%= @data[:description] %>'
				version			     '<%= @data[:description] %>'

				<% @data[:dependencies].each do |dependency| %><%= \"depends '#{dependency}'\" %>
				<% end %>
		"}

		BerksFile = {
			name: 'berksfile',
			path: 'Berksfile', 
			template: "
				<%= \"source #{@data[:source]}\"  %>

				metadata

				<% @data[:cookbooks].each do |cookbook| %><%= \"cookbook #{cookbook}\" %>
				<% end %>

			"}

		Attributes = {
			name: 'attributes',
			path: 'attributes/default.rb', 
			template:"

			"}

		Gemfile = {
			name: 'gemfile',
			path: 'Gemfile', 
			template: = "
				app_name = '<%= NAME %>'
				# default[app_name]['install_path'] = \"C:\\wwwcom\\services\\<%= DOT_NAME %>\"
				# default[app_name]['executable_name'] = (\"#{%x(gem env gemdir).strip.gsub('/','\\')}\\gems\\#{app_name}-#{installing_version}\\rake service:start\")
				default[app_name]['service_name'] = app_name
				default[app_name]['user'] = \"#{app_name}_user\"

				#Config file parameters
				default[app_name]['port'] = \"80\"

				# default[app_name]['log_file_name_debug'] = \"C:\\wwwcom\\gg.logs\\<%=DOT_NAME%>\\<%=DOT_NAME%>_Debug.log\"
				# default[app_name]['log_file_name_error'] = \"C:\\wwwcom\\gg.logs\\<%=DOT_NAME%>\\<%=DOT_NAME%>_Error.log\"

				#Very important. Several deployment scripts rely on CookbookVersion being published
				default[app_name]['CookbookVersion'] = run_context.cookbook_collection[app_name].metadata.version

				#Make environment monitoring tools aware that the standardised health check is available on /status/health.
				#Include the GG.Internal.MonitoringComponents library to support this.
				default[app_name]['SupportsHealthCheck'] = true

				#Make environment monitoring tools aware that this application uses the blue/green deployment model.
				default[app_name]['SupportsBlueGreen'] = true
			"}

	end
end