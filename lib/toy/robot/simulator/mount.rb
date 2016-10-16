require 'toy/robot/simulator/commands'
module Toy
  module Robot
    module Simulator
      class Mount
        include Simulator::Commands
        attr_reader :table_size

        def initialize(table_size=5, output=STDOUT)
          @table_size = table_size
          @output=output
        end

        def start(command)
          operation, operation_details = command.to_s.downcase.split ' '
          operation_details = operation_details.split(',') if operation_details

          fail Simulator::Errors::InvalidCommand, 'Undefined operation!' unless Simulator::Commands.public_method_defined?(operation)
          public_send operation.to_sym, *operation_details
        rescue ArgumentError
          fail Simulator::Errors::InvalidCommand, 'Something went wrong!'
        end

        def start_reading_file(input)
          input.each_line do |line|
            begin
              start(line)
            rescue
              fail Simulator::Errors::InvalidCommand, 'File contains invalid commands!'
            end
          end
        end

        private

        def valid_position?(x, y, face)
          fail Simulator::Errors::InvalidCommand, 'Position is not valid!' unless x && y && face
          fail Simulator::Errors::InvalidCommand, 'You are placing outside of the table!' unless (0..table_size).include? x
          fail Simulator::Errors::InvalidCommand, 'You are placing outside of the table!' unless (0..table_size).include? y
        end
      end
    end
  end
end
