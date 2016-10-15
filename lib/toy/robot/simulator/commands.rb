module Toy
  module Robot
    module Simulator
      module Commands
        def place(x, y, face)
          face = Direction.new(x, y, face).facing_toward
          valid_position?(x.to_i, y.to_i, face)
          @x, @y, @face = x, y, face
        end

        def move
          raise InvalidCommand.new unless @face
          new_x, new_y = @face.step_forward(@x, @y)
          valid_position?(new_x, new_y, @face)
          @x, @y = new_x, new_y
        end

        def left
          raise InvalidCommand.new unless @face
          @face = @face.turn_left
        end

        def right
          raise InvalidCommand.new unless @face
          @face = @face.turn_right
        end

        def report
          raise InvalidCommand.new unless @face
          @output.puts "#{@x},#{@y},#{@face}"
        end
      end
    end
  end
end
