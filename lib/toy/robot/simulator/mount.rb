module Toy
  module Robot
    module Simulator
      class Mount
        attr_reader :table_size
        def initialize(table_size=5)
          @table_size = table_size
        end

        def start(command)
          operation, operation_details = command.to_s.split ' '
          operation_details = args.split(',') if operation_details

          fail InvalidCommand.new unless Commands.public_method_defined?(operation)
          public_send "Toy::Robot::Simulator.#{operation}", *operation_details
        rescue ArgumentError
          fail InvalidCommand
        end

        private

        def valid_position?(x, y, face)
          fail InvalidCommand unless x && y && face
          fail InvalidCommand unless (0..table_size).include? x
          fail InvalidCommand unless (0..table_size).include? y
        end
      end
    end
  end
end
