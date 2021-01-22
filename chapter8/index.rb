require "forwardable"
require "ostruct"

class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  extend Forwardable
  include Enumerable
  def_delegators :@parts, :size, :length, :each

  # attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    # parts.select { |part| part.needs_spare }
    select { |part| part.needs_spare }
  end
end

module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.collect { |part_config|
        create_part(part_config)
      }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name: part_config[0],
      description: part_config[1],
      needs_spare: part_config.fetch(2, true),
    )
  end
end

mountain_config = [
  ["chain", "10-speed"],
  ["tire_size", "2.1"],
  ["front_shock", "Manitou", false],
  ["rear_shock", "Fox"],
]

road_parts = PartsFactory.build(mountain_config)
road_bike = Bicycle.new(size: "23", parts: road_parts)

puts road_bike.spares
