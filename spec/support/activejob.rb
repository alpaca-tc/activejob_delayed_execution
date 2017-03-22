ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.include(ActiveJob::TestHelper)

  config.around do |example|
    ActiveJob::Base.logger.silence do
      example.run
    end
  end
end
