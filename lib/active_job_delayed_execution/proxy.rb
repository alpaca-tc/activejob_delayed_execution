module ActiveJobDelayedExecution
  class Proxy < BasicObject
    def initialize(object, options = {})
      @object = object
      @options = options
    end

    def method_missing(name, *args)
      DelayedExecutionJob.set(@options).perform_later(@object, name.to_s, *args)
    end
  end
end
