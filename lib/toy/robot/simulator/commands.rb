module Toy
  module Robot
    module Simulator
      module Commands
        def place(x, y, face)
          @x, @y = x.to_i, y.to_i
          valid_position?(@x, @y, face)
          @face = Direction.new(@x, @y, face)
        end

        def move
          validate_direction(@face)
          new_x, new_y = @face.step_forward(@x, @y)
          valid_position?(new_x, new_y, @face)
          @x, @y = new_x, new_y
        end

        def left
          validate_direction(@face)
          @face = @face.turn_left
        end

        def right
          validate_direction(@face)
          @face = @face.turn_right
        end

        def report
          validate_direction(@face)
          output_report = "#{@x},#{@y},#{@face.faced_to}"
          @output.puts output_report
          puts output_report
          output_report
        end

        private

        def validate_direction(face)
          fail Simulator::Errors::InvalidCommand, 'Could not find facing direction!' unless face
        end
      end
    end
  end
end
