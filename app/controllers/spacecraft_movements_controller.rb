class SpacecraftMovementsController < ApplicationController



private

  def set_initial_state
    @position = { x: 0, y: 0, z: 0 }
    @direction = 'N'
  end
end

