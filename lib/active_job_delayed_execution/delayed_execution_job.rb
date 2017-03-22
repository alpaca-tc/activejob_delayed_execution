module ActiveJobDelayedExecution
  class DelayedExecutionJob < ActiveJobDelayedExecution.parent_class
    def perform(object, public_method_name, *arguments)
      object.public_send(public_method_name, *arguments)
    end
  end
end
