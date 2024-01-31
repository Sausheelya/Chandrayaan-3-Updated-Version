require 'rails_helper'

RSpec.describe SpacecraftMovementsController do
  let(:controller) { SpacecraftMovementsController.new }

  # Test cases for initialization
  describe '#set_initial_state' do
    it 'initializes the spacecraft controller with default values' do
      controller.send(:set_initial_state)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 })
      expect(controller.instance_variable_get(:@direction)).to eq('N')
    end
  end

  # Test cases for the move_forward method
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

  # Test Cases for move backward method
  describe '#move_backward' do
    it 'moves backward in the correct direction (North)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'N')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: -1, z: 0 })
    end

    it 'moves backward in the correct direction (South)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'S')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 1, z: 0 })
    end

    it 'moves backward in the correct direction (East)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'E')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: -1, y: 0, z: 0 })
    end

    it 'moves backward in the correct direction (West)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'W')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 1, y: 0, z: 0 })
    end

    it 'moves backward in the correct direction (Up)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Up')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: -1 })
    end

    it 'moves backward in the correct direction (Down)' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Down')
      controller.send(:move_backward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 1 })
    end
  end

  # Test Cases for turn Left
  describe '#turn_left' do
    context 'when initially facing North' do
      it 'turns left to face West' do
        controller.send(:set_initial_state)
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('W')
      end
    end

    context 'when initially facing South' do
      it 'turns left to face East' do
        controller.send(:set_initial_state)
        controller.instance_variable_set(:@direction, 'S')
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('E')
      end
    end

    context 'when initially facing East' do
      it 'turns left to face North' do
        controller.send(:set_initial_state)
        controller.instance_variable_set(:@direction, 'E')
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('N')
      end
    end

    context 'when initially facing West' do
      it 'turns left to face South' do
        controller.send(:set_initial_state)
        controller.instance_variable_set(:@direction, 'W')
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('S')
      end
    end

    context 'when initially facing Up' do
      it 'does not change the direction when turning left' do
        controller.send(:set_initial_state)
        controller.instance_variable_set(:@direction, 'Up')
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('Up')
      end
    end

    context 'when initially facing Down' do
      it 'does not change the direction when turning left' do
        controller.send(:set_initial_state)
        controller.instance_variable_set(:@direction, 'Down')
        controller.send(:turn_left)
        expect(controller.instance_variable_get(:@direction)).to eq('Down')
      end
    end
  end

  # Test cases for turn right
  describe '#turn_right' do
    it 'turns right from North to East' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'N')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('E')
    end

    it 'turns right from East to South' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'E')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('S')
    end

    it 'turns right from South to West' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'S')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('W')
    end

    it 'turns right from West to North' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'W')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('N')
    end

    it 'turns right from Up to East' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Up')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('E')
    end

    it 'turns right from Down to West' do
      controller.send(:set_initial_state)
      controller.instance_variable_set(:@direction, 'Down')
      controller.send(:turn_right)
      expect(controller.instance_variable_get(:@direction)).to eq('W')
    end
  end

# Test cases for turn up
describe '#turn_up' do
  it 'turns up and adjusts the position' do
    controller.send(:set_initial_state)
    controller.send(:turn_up)
    expect(controller.instance_variable_get(:@direction)).to eq('Up')
    expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 }) # Updated position expectation
  end

  it 'keeps the existing direction when not N, S, E, or W' do
    controller.send(:set_initial_state)
    controller.instance_variable_set(:@direction, 'Up')
    controller.send(:turn_up)
    expect(controller.instance_variable_get(:@direction)).to eq('Up')
    expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 }) # Updated position expectation
  end
end

# Test cases for turn down
describe '#turn_down' do
  it 'turns down and adjusts the position' do
    controller.send(:set_initial_state)
    controller.send(:turn_down)
    expect(controller.instance_variable_get(:@direction)).to eq('Down')
    expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 }) # Updated position expectation
  end

  it 'keeps the existing direction when not N, S, E, or W' do
    controller.send(:set_initial_state)
    controller.instance_variable_set(:@direction, 'Down')
    controller.send(:turn_down)
    expect(controller.instance_variable_get(:@direction)).to eq('Down')
    expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 0, z: 0 }) # Updated position expectation
  end
end

  # Test case for the main method
  
  describe '#execute_commands' do
    it 'executes a sequence of commands and returns the correct JSON response' do
      controller.send(:set_initial_state)

      commands = ['f', 'r', 'u', 'b', 'l']
      expected_response = {
        phases: [
          { command: 'f', position: { x: 0, y: 1, z: 0 }, direction: 'N' },
          { command: 'r', position: { x: 0, y: 1, z: 0 }, direction: 'E' },
          { command: 'u', position: { x: 0, y: 1, z: 0 }, direction: 'Up' },
          { command: 'b', position: { x: 0, y: 1, z: -1 }, direction: 'Up' },
          { command: 'l', position: { x: 0, y: 1, z: -1 }, direction: 'Up' }
        ],
        final_position: { x: 0, y: 1, z: -1 },
        final_direction: 'Up'
      }

      allow(controller).to receive(:render) do |options|
        expect(options[:json]).to eq(expected_response)
      end

      controller.params = { commands: commands }
      controller.send(:execute_commands)
    end
  end
end
