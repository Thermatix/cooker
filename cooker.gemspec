# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/cooker/meta_data'
ignore_list = %w( .git .gitignore .gitattributes )
folder_list = %w(lib bin spec tasks ).join(',')
Gem::Specification.new do |spec|
  spec.name          = Name
  spec.version       = Vesion
  spec.authors       = ["Thermatix"]
  spec.email         = ['mbecker@gmail.com']
  spec.summary       = %q{Gem file for easy deployment of sinatra app.}
  spec.description   = ''
  spec.homepage      = "https://github.com/JustGiving/gg.web.opsboard"
  spec.license       = Licence
  spec.files         = (Dir.glob("{#{folder_list}}/**/**/*") + Dir.glob("*").reject { |file| ignore_list.include?(file)}).map  {|file_path| file_path.gsub('/','\\')}
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"


end

