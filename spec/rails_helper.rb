# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'json_expressions/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/json_expressions/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Helpers::Session
  config.include Helpers::Responses

  # As we're only generating json views is ok for rspec to render them every time/
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.render_views = true

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.before do |example|

    if example.metadata[:type] == :controller
      request.headers['accept'] = 'application/json'

      unless example.metadata[:skip_login]
        user = create(:user)
        authenticate_user(user)
      end
    end

  end

end
