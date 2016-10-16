require 'spec_helper'

RSpec.describe Toy::Robot::Simulator::Mount do
  let(:instance) { described_class.new }

  RSpec.shared_examples 'Assignment of an instance variable' do |variable, expected_value|
    it { expect(subject.instance_variable_get(variable)).to eq expected_value }
  end

  describe '#start' do
    let(:command) { 'lets start!' }
    subject { instance.start(command) }

    context '#place' do
      let(:command) { 'PLACE 1,2,EAST' }

      it { is_expected.to be_a Toy::Robot::Simulator::Direction }
      include_examples 'Assignment of an instance variable', :@x, 1
      include_examples 'Assignment of an instance variable', :@y, 2
      include_examples 'Assignment of an instance variable', :@face, :east
    end

    context '#move' do
      let(:place_command) { 'PLACE 1,2,EAST' }
      let(:command) { 'MOVE' }

      before { instance.start(place_command) }
      context 'valid move' do
        it { is_expected.to eq [2, 2]}
      end
    end
  end
end