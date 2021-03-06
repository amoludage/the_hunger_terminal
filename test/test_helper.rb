ENV["RAILS_ENV"] = "test"

require 'simplecov' 
require "codeclimate-test-reporter"
SimpleCov.start 
CodeClimate::TestReporter.start


require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "database_cleaner"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Umment for awesome colorful output
# require "minitest/pride"

module CreateOrderHelper
  def create_order
    some_time = Time.parse "10 AM"  ## gives time object in IST time zone
    Time.stub(:now, some_time) do
      order_obj = create :order
    end
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryGirl::Syntax::Methods
  fixtures :all
  DatabaseCleaner.strategy = :truncation

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
 #after { DatabaseCleaner.clean }
  # Add more helper methods to be used by all tests here...
end
