require 'spec_helper'

RSpec.describe ActiveJob::DelayedExecution::DelayedExecutionJob do
  subject { described_class.perform_now(object, public_method_name, *arguments) }

  let(:object) { Object.new }
  let(:public_method_name) { 'methods' }
  let(:arguments) { [true] }

  it 'executes arguments' do
    expect(object).to receive(public_method_name).with(*arguments).once
    subject
  end
end
