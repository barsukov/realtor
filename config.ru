# This file is used by Rack-based servers to start the rails_admin.

require ::File.expand_path('../config/environment',  __FILE__)
run RailsAdmin::Application
