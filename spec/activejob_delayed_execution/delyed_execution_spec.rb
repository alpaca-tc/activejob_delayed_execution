require 'spec_helper'

describe ActiveJobDelayedExecution do
  describe 'VERSION' do
    it 'has a version number' do
      expect(ActiveJobDelayedExecution::VERSION).not_to be nil
    end
  end

  describe '.delayed' do
    let(:klass) do
      Class.new do
        include ActiveJobDelayedExecution
        include GlobalID::Identification

        def self.name; 'ClassName' end
        def id; 1 end
      end
    end

    it 'enqueues DelayedExecutionJob' do
      expect { klass.new.delayed.methods }.to change {
        enqueued_jobs.map { |v| v[:job] }
      }.from([]).to([ActiveJobDelayedExecution::DelayedExecutionJob])
    end
  end
end
