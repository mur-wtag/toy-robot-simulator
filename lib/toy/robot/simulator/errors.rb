module Toy
  module Robot
    module Simulator
      class Errors
        class InvalidCommand < Exception
          def initialize(error)
            @error = error
          end

          def to_s
            "InvalidCommad: #{@error.to_s}"
          end
        end
      end
    end
  end
end
