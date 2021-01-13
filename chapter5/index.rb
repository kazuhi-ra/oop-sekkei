class Trip
  attr_reader :bicycles, :customers, :vehicle
  def initialize(bicycles)
    @bicycles = bicycles
  end

  def prepare(preparers)
    preparers.each do |preparer|
      case prepare
      when Mechanic
        prepare.prepare_bicycles(bicycles)
      when TripCoordinator
        prepare.buy_food(customers)
      when Driver
        prepare.gas_up(vehicle)
        prepare.fill_water_tank(vehicle)
      end
    end
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

class TripCoordinator
  def prepare_bicycles(bicycles)
  end
end

class Driver
  def gas_up(vehicle)
  end
  
  def fill_water_tank(vehicle)
  end
end


mechanic = Mechanic.new()
trip = Trip.new(['kaz', 'hit', 'pas'], mechanic)
