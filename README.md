# Toy::Robot::Simulator [![Build Status](https://travis-ci.org/mur-wtag/toy-robot-simulator.svg?branch=master)](https://travis-ci.org/mur-wtag/toy-robot-simulator)
Simple robot Simulator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toy-robot-simulator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toy-robot-simulator

## Usages

To operate with single command, use:

```ruby
command = 'PLACE 0,0,NORTH'
simulator = Toy::Robot::Simulator::Mount.new
simulator.start(command)
simulator.report
# => 0,0,NORTH
```

Also able to provide command stream using file_path(i/o):
```ruby
file_path = './fixtures/input_sample_c.txt'
simulator = Toy::Robot::Simulator::Mount.new
simulator.start_reading_file(file_path)
# => 3,3,NORTH
```

## Test
Inside `/fixtures` directory there are all three sample files, and these file are being used from specs.

To run spec (from root directory of the project):
```shell
bundle exec rspec
```

Thanks!
