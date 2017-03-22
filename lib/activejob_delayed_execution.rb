require 'activejob_delayed_execution/version'

module ActiveJobDelayedExecution
  autoload :DelayedExecutionJob, 'activejob_delayed_execution/delayed_execution_job'
  autoload :Proxy, 'activejob_delayed_execution/proxy'

  def delayed
    Proxy.new(self)
  end
end
