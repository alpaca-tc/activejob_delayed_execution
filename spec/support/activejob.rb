ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.include(ActiveJob::TestHelper)
end
