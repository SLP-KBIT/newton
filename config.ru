# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if ENV['RAILS_RELATIVE_URI_ROOT']
  map ENV['RAILS_RELATIVE_URI_ROOT'] do 
    run Rails.application
  end
else
  run Rails.application
end
