require 'yaml'
require 'cooker/meta_data'
require 'cooker/main'
require 'cooker/generator'

Dir['cooker/templates/*.rb'].sort.each do  |file| 
	require file 
end