class SpacecraftMovementsController < ApplicationController



private

  def set_initial_state
    @position = { x: 0, y: 0, z: 0 }
    @direction = 'N'
  end

  def move_forward
    case @direction
    when 'N'
      @position[:y] += 1
    when 'S'
      @position[:y] -= 1
    when 'E'
      @position[:x] += 1
    when 'W'
      @position[:x] -= 1
    when 'Up'
      @position[:z] -= 1
    when 'Down'
      @position[:z] += 1
    end
  end
end

