$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'active_job'
require 'activejob/delayed_execution'

ActiveJob::Base.queue_adapter = :test
GlobalID.app = 'delayedexecution'

RSpec.configure do |config|
  config.include ActiveJob::TestHelper
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
