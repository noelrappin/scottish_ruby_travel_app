$: << File.expand_path("app")
require 'rspec/expectations'
require 'active_record'
require 'database_cleaner'
require 'pry'
require 'awesome_print'
require 'open_active_model'
 
connection_info = YAML.load(File.open("config/database.yml"))["test"]
ActiveRecord::Base.establish_connection(connection_info)
 
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
 
def require_number_modules
  require 'active_support/core_ext/date/conversions'
  require 'active_support/core_ext/hash/keys'
  require 'active_support/core_ext/hash/reverse_merge'
  require 'active_support/i18n'
  require 'action_view/helpers/number_helper'
end