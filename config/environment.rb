# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
EStore::Application.initialize!
ActiveRecord::Base.logger = Logger.new(STDOUT)
