module Cooker
	module Meta
		::Root = (Root = File.expand_path(__FILE__)
						.split('/'))
						.shift(Root.length - 1)
						.join('/').freeze
		::G_Root = ROOT.gsub('/lib','')		
		::Info
		::Name = 'Cooker'
		::Version = '0.0.0'
	end
end
