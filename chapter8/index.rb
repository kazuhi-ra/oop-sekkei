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
  attr_reader :chain, :tire_size

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

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size
    "23"
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def default_tire_size
    "2.1"
  end

  def local_spares
    { rear_shock: rear_shock }
  end
end

rbp = RoadBikeParts.new(
  tape_color: "red",
)
mbp = MountainBikeParts.new(
  front_shock: nil,
  rear_shock: nil,
)

road_bike = Bicycle.new(
  size: "23",
  parts: rbp,
)
p road_bike.spares
