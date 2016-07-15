require_relative 'boot'
require 'rails/all'
	Bundler.require(*Rails.groups)

	module Blog
  	class Application < Rails::Application
  	end
end
