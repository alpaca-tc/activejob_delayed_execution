describe ActiveJobDelayedExecution::Proxy do
  describe '.method_missing' do
    subject { described_class.new(object) }
    let(:object) { '' }

    it 'enqueues DelayedExecutionJob' do
      expect { subject.to_s }.to change {
        enqueued_jobs.map { |v| v[:job] }
      }.from([]).to([ActiveJobDelayedExecution::DelayedExecutionJob])
    end
  end
end
