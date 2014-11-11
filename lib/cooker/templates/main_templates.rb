module Cooker
	module Templates
		Dir['templates/*.rb'].each do |file|
			name = File.basename (file)
			path = file.gsub('.erb','')
			instance_varaible_set name,{
					name: name
					path: path
					template: File.read(file)
				} 
			define_singleton_method name do
				instance_varaible_get name
			end
		end
		File.open(File.expand_path './pathmod') do |file| 
			file.split("\n").each do |line|
			 	file,path =	line.split(':')
			 	self.call(file)[:path] = path
			end
		end

	end
end