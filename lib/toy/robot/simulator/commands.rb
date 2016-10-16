module Toy
  module Robot
    module Simulator
      module Commands
        def place(x, y, face)
          valid_position?(x, y, face)
          @x, @y = x, y
          @face = Direction.new(x, y, face)
        end

        def move
          fail InvalidCommand.new unless @face
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
          @output.puts "#{@x},#{@y},#{@face.faced_to}"
        end
      end
    end
  end
end
