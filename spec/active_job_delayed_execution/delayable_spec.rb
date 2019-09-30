describe ActiveJobDelayedExecution::Delayable do
  describe '#delayed' do
    let(:string) do
      'hello'.tap do |string|
        string.extend(described_class)
      end
    end

    # BasicObjectのクラスに対して #is_a? などは使えないため
    def get_class(object)
      object.instance_eval do
        class << self
          self.superclass
        end
      end
    end

    context 'without arguments' do
      it { expect(get_class(string.delayed)).to be(ActiveJobDelayedExecution::Proxy) }

      it 'enqueues DelayedExecutionJob without options' do
        string.delayed.do_something

        expect(enqueued_jobs.map { |v| v[:job] }).to eq([ActiveJobDelayedExecution::DelayedExecutionJob])
        expect(enqueued_jobs.map { |v| v[:queue] }).to eq(['default'])
      end
    end

    context 'with arguments' do
      it 'enqueues DelayedExecutionJob with options' do
        string.delayed(queue: 'low').do_something

        expect(enqueued_jobs.map { |v| v[:job] }).to eq([ActiveJobDelayedExecution::DelayedExecutionJob])
        expect(enqueued_jobs.map { |v| v[:queue] }).to eq(['low'])
      end
    end
  end
end
