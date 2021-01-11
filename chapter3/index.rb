class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches(diameter)
    ratio * diameter
  end
end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim, tire, gear)
    @rim = rim
    @tire = tire
    @gear = gear
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end

  def circumference
    diameter * Math::PI
  end
end

p Wheel.new(26, 1.5, Gear.new(52, 11)).gear_inches
