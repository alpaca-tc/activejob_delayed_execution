module ActiveJobDelayedExecution
  module Delayable
    def delayed(options = {})
      ActiveJobDelayedExecution::Proxy.new(self, options)
    end
  end
end
