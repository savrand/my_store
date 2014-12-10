
# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment.rb', __FILE__)
require 'rspec/rails'
require 'ffaker'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/factories/**"].each do |f|
  require File.expand_path(f)
end
# Requires factories defined in spree_core
require 'spree/testing_support/factories'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/capybara_ext'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
# == URL Helpers
#
# Allows access to Spree's routes in specs:
#
# visit spree.admin_path
# current_path.should eql(spree.products_path)
  config.include Spree::TestingSupport::UrlHelpers
# == Mock Framework
#
# If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
#
# config.mock_with :mocha
# config.mock_with :flexmock
# config.mock_with :rr
  config.mock_with :rspec
  config.color = true
# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
# Capybara javascript drivers require transactional fixtures set to false, and we use DatabaseCleaner
# to cleanup after each test instead. Without transactional fixtures set to false the records created
# to setup a test will be unavailable to the browser, which runs under a separate server instance.
  config.use_transactional_fixtures = false
# Ensure Suite is set to use transactions for speed.
  config.fail_fast = ENV['FAIL_FAST'] || false
  config.include Capybara::DSL, :type => :request
  config.filter_run :focus => true
  config.infer_spec_type_from_file_location!
  config.run_all_when_everything_filtered = true
end