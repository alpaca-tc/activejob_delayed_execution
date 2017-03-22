describe ActiveJobDelayedExecution::Delayable do
  describe '#delayed' do
    subject { string.delayed }

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

    it { expect(get_class(subject)).to be(ActiveJobDelayedExecution::Proxy) }
  end
end
