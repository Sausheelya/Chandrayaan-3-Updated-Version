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

  def move_backward
    case @direction
    when 'N'
      @position[:y] -= 1
    when 'S'
      @position[:y] += 1
    when 'E'
      @position[:x] -= 1
    when 'W'
      @position[:x] += 1
    when 'Up'
      @position[:z] += 1
    when 'Down'
      @position[:z] -= 1
    end
  end

  def turn_left
    case @direction
    when 'N'
      @direction = 'W'
    when 'S'
      @direction = 'E'
    when 'E'
      @direction = 'N'
    when 'W'
      @direction = 'S'
    when 'Up', 'Down'
      # No change in direction when facing Up or Down
    end
  end
  
  def turn_right
    @direction = case @direction
                 when 'N' then 'E'
                 when 'E' then 'S'
                 when 'S' then 'W'
                 when 'W' then 'N'
                 when 'Up' then 'E'
                 when 'Down' then 'W'
                 else @direction
                 end
  end
end

