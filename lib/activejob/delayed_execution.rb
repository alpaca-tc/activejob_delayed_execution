require 'activejob/delayed_execution/version'

module ActiveJob
  module DelayedExecution
    autoload :DelayedExecutionJob, 'activejob/delayed_execution/delayed_execution_job'

    class Proxy < BasicObject
      def initialize(object)
        @object = object
      end

      def method_missing(name, *args)
        DelayedExecutionJob.perform_later(@object, name.to_s, *args)
      end
    end

    private_constant :Proxy

    def delayed
      Proxy.new(self)
    end
  end
end
