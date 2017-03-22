module ActiveJobDelayedExecution
  module Delayable
    def delayed
      ActiveJobDelayedExecution::Proxy.new(self)
    end
  end
end
