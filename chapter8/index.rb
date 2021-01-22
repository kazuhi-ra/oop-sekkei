require 'forwardable'

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
    parts.select { |part| part.need_spare }
  end
end

class Part
  attr_reader :name, :description, :need_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @need_spare = args.fetch(:need_spare, true)
  end
end

chain = Part.new(name: "chain", description: "10-speed")
road_tire = Part.new(name: "tire_size", description: "23")
tape = Part.new(name: "tape", description: "red")

road_bike_parts = Parts.new([chain, road_tire, tape])

road_bike = Bicycle.new(
  size: "23",
  parts: road_bike_parts,
)
puts road_bike.parts.length
