class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * (rim + (tire * 2))
  end

end

p Gear.new(52, 11, 26, 1.5).gear_inches

class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    data.collect {|cell|
      cell[0] + (cell[1] * 2)}
  end
end

p ObscuringReferences.new([[10, 100], [50, 500]]).diameters
