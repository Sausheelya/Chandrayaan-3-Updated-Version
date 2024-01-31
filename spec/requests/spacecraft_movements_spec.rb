require 'rails_helper'
RSpec.describe SpacecraftMovementsController do
  let(:controller) { SpacecraftMovementsController.new }

  describe '#set_initial_state' do
    it 'initializes the spacecraft controller with default values' do
      controller.send(:set_initial_state)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 })
      expect(controller.instance_variable_get(:@direction)).to eq('N')
    end
  end

  describe '#move_forward' do
    it 'moves forward in the correct direction' do
      controller.send(:set_initial_state)
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 1, z: 0 })
    end
  end

end


