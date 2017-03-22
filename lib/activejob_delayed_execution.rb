require 'active_job'
require 'activejob_delayed_execution/version'

module ActiveJobDelayedExecution
  autoload :DelayedExecutionJob, 'activejob_delayed_execution/delayed_execution_job'
  autoload :Delayable, 'activejob_delayed_execution/delayable'
  autoload :Proxy, 'activejob_delayed_execution/proxy'

  mattr_accessor :parent_class_name
  self.parent_class_name = 'ActiveJob::Base'

  def self.parent_class
    parent_class_name.constantize
  end
end
