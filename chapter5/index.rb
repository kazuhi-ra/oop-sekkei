class Trip
  attr_reader :bicycles
  def initialize(bicycles, mechanic)
    @bicycles = bicycles
  end

  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

class Mechanic
def prepare_bicycles(bicycles)
    bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end

  def prepare_bicycle(bicycle)
    puts "#{bicycle}を整備しました"
  end
end

mechanic = Mechanic.new()
trip = Trip.new(['kaz', 'hit', 'pas'], mechanic)
