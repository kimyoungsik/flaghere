# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Flaghere::Application.initialize!

config.action_mailer.default_url_options = { :host => 'mangomountain.kr' }