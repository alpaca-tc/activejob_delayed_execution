module ActiveJobDelayedExecution
  class Proxy < BasicObject
    def initialize(object)
      @object = object
    end

    def method_missing(name, *args)
      DelayedExecutionJob.perform_later(@object, name.to_s, *args)
    end
  end
end
