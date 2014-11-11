app_name = '<%= @data[:name] %>'
# default[app_name]['install_path'] = \"C:\\wwwcom\\services\\<%= @data[:dot_name] %>\"
# default[app_name]['executable_name'] = (\"#{%x(gem env gemdir).strip.gsub('/','\\')}\\gems\\#{app_name}-#{installing_version}\\rake service:start\")
default[app_name]['service_name'] = app_name
default[app_name]['user'] = \"#{app_name}_user"

#Config file parameters
default[app_name]['port'] = \"80"

# default[app_name]['log_file_name_debug'] = \"C:\\wwwcom\\gg.logs\\<%=@data[:dot_name]%>\\<%=@data[:dot_name]%>_Debug.log\"
# default[app_name]['log_file_name_error'] = \"C:\\wwwcom\\gg.logs\\<%=@data[:dot_name]%>\\<%=@data[:dot_name]%>_Error.log\"

#Very important. Several deployment scripts rely on CookbookVersion being published
default[app_name]['CookbookVersion'] = run_context.cookbook_collection[app_name].metadata.version

#Make environment monitoring tools aware that the standardised health check is available on /status/health.
#Include the GG.Internal.MonitoringComponents library to support this.
default[app_name]['SupportsHealthCheck'] = true

#Make environment monitoring tools aware that this application uses the blue/green deployment model.
default[app_name]['SupportsBlueGreen'] = true