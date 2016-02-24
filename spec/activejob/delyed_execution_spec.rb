require 'spec_helper'

describe ActiveJob::DelayedExecution do
  describe 'VERSION' do
    it 'has a version number' do
      expect(ActiveJob::DelayedExecution::VERSION).not_to be nil
    end
  end

  describe '.delayed' do
    let(:klass) do
      Class.new do
        include ActiveJob::DelayedExecution
        include GlobalID::Identification

        def self.name; 'ClassName' end
        def id; 1 end
      end
    end

    it 'enqueues DelayedExecutionJob' do
      expect { klass.new.delayed.methods }.to change {
        enqueued_jobs.map { |v| v[:job] }
      }.from([]).to([ActiveJob::DelayedExecution::DelayedExecutionJob])
    end
  end
end
