class SpacecraftMovementsController < ApplicationController

	def execute_commands
  commands = params[:commands]

  phases = []
  
  commands.each do |command|
    case command
    when 'f'
      move_forward
    when 'b'
      move_backward
    when 'l'
      turn_left
    when 'r'
      turn_right
    when 'u'
      turn_up
    when 'd'
      turn_down
    else
      # Handle invalid command (optional)
    end

    phases << { command: command, position: @position.dup, direction: @direction }
  end

  render json: { phases: phases, final_position: @position, final_direction: @direction }
end



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

def turn_up
    @direction = case @direction
                 when 'N' then 'Up'
                 when 'S' then 'Down'
                 else @direction
                 end
  end


    def turn_down
    @direction = case @direction
                 when 'N' then 'Down'
                 when 'S' then 'Up'
                 else @direction
                 end
  end