module ActiveJob
  module DelayedExecution
    class DelayedExecutionJob < ActiveJob::Base
      def perform(object, public_method_name, *arguments)
        object.public_send(public_method_name, *arguments)
      end
    end
  end
end
