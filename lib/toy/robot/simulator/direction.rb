module Toy
  module Robot
    module Simulator
      class Direction
        DIRECTIONS = [:north, :east, :south, :west]
        DIRECTION_MAPPER = {
          # faced_to: on_left, on_right
          north: [3, 1],
          east: [0, 2],
          south: [1, 3],
          west: [2, 0]
        }
        STEP_MAPPER = {
          north: [0, 1],
          east: [1, 0],
          south: [0, -1],
          west: [-1, 0]
        }
        def initialize(x, y, face)
          @x, @y = x, y
          @face = face.downcase.to_sym
        end

        def faced_to
          @face.to_s.upcase
        end

        def step_forward(x, y)
          step_count = STEP_MAPPER[@face.to_sym]
          [x + step_count[0], y + step_count[1]]
        end

        def turn_left
          # Anti-clockwise [N, E, S, W]
          Direction.new(@x, @y, DIRECTIONS[DIRECTION_MAPPER[@face][0]])
        end

        def turn_right
          # Clockwise [W, S, E, N]
          Direction.new(@x, @y, DIRECTIONS[DIRECTION_MAPPER[@face][1]])
        end
      end
    end
  end
end
