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

    context '#left' do
      let(:place_command) { 'PLACE 1,2,EAST' }
      let(:command) { 'LEFT' }

      before { instance.start(place_command) }
      context 'valid move' do
        it { expect(subject.faced_to).to eq 'NORTH'}
      end
    end

    context '#right' do
      let(:place_command) { 'PLACE 1,2,EAST' }
      let(:command) { 'RIGHT' }

      before { instance.start(place_command) }
      context 'valid move' do
        it { expect(subject.faced_to).to eq 'SOUTH'}
      end
    end

    context '#report' do
      let(:place_command) { 'PLACE 1,2,EAST' }
      let(:turn_command) { 'RIGHT' }
      let(:command) { 'REPORT' }

      before do
        instance.start(place_command)
        instance.start(turn_command)
      end

      it { expect(instance.report).to eq '1,2,SOUTH' }
    end
  end

  describe '#start_reading_file' do
    subject { instance.start_reading_file(file) }

    context 'sample #a' do
      let(:file) { File.new('./fixtures/input_sample_a.txt') }
      xit { expect(subject).to eq 'asdads' }
    end
  end
end
