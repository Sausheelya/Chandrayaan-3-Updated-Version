RSpec.describe SpacecraftController do
  let(:controller) { SpacecraftController.new }

  describe '#move_forward' do
    it 'moves forward in the correct direction' do
      controller.send(:set_initial_state)
      controller.send(:move_forward)
      expect(controller.instance_variable_get(:@position)).to eq({ x: 0, y: 1, z: 0 })
    end

  end
end
