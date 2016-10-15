module Toy
  module Robot
    module Simulator
      class Direction
        def initialize(x, y, face)
          @x = x
          @y = y
          @face = face
        end

        def step_forward(x, y)
          [@x + x, @y + y]
        end

        def facing_toward

        end

        def turn_left

        end

        def turn_right

        end
      end
    end
  end
end
