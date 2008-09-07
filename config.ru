require 'rubygems'
require 'merb-core'

Merb::Config.setup( :merb_root   => ".", :environment => ENV['RACK_ENV'], :session_store => 'none', :path_prefix => '/upload' )
Merb.environment = Merb::Config[:environment]
Merb.root = Merb::Config[:merb_root]
Merb::BootLoader.run

run Merb::Rack::Application.new
