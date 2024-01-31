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
    it 'moves forward in the correct direction (North)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'N')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 1, z: 0 })
    end

    it 'moves forward in the correct direction (South)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'S')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: -1, z: 0 })
    end

    it 'moves forward in the correct direction (East)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'E')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 1, y: 0, z: 0 })
    end

    it 'moves forward in the correct direction (West)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'W')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: -1, y: 0, z: 0 })
    end

    it 'moves forward in the correct direction (Up)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Up')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: -1 })
    end

    it 'moves forward in the correct direction (Down)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Down')
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 1 })
    end
  end
end
