require 'spec_helper'

RSpec.describe Toy::Robot::Simulator::Direction do
  let(:position_x) { 1 }
  let(:position_y) { 0 }
  let(:faced) { 'EAST' }
  let(:instance) { described_class.new(position_x, position_y, faced) }

  describe '#faced_to' do
    context 'initially faced to EAST' do
      it { expect(instance.faced_to).to eq 'EAST' }
    end
  end

  describe '#step_forward' do
    context '1 step forward' do
      it { expect(instance.step_forward(position_x, position_y)).to eq [2, 0] }
    end
  end

  describe '#turn_left' do
    context 'turn left from EAST' do
      it { expect(instance.turn_left.faced_to).to eq 'NORTH' }
    end
  end

  describe '#turn_right' do
    context 'turn right from EAST' do
      it { expect(instance.turn_right.faced_to).to eq 'SOUTH' }
    end
  end
end
