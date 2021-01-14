class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed'
  end
  
  def default_tire_size
    raise NotImplementedError
  end

  def spares
    {
      chain: chain,
      tire_size: tire_size,
    }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def default_tire_size
    '23'
  end

  def spares
    super.merge(tape_color: tape_color)
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def default_tire_size
    '2.1'
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

p RoadBike.new(
  size: 'S',
  tape_color: 'red',
).spares


p MountainBike.new(
  size: 'M',
  front_shock: 'Manitou',
  rear_shock: 'Fox',
).spares
