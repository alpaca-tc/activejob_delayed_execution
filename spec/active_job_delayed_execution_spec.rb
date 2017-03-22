RSpec.describe ActiveJobDelayedExecution do
  around do |example|
    backup = described_class.parent_class_name
    described_class.parent_class_name = parent_class_name
    example.run
    described_class.parent_class_name = backup
  end

  describe '.parent_class' do
    subject { described_class.parent_class }
    let(:parent_class_name) { 'String' }

    it 'constantize parent_class' do
      is_expected.to be(String)
    end
  end
end
