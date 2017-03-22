$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'activejob_delayed_execution'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.order = :random
  config.profile_examples = 10

  unless ENV['CIRCLECI']
    config.filter_run :focus
    config.run_all_when_everything_filtered = true
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
