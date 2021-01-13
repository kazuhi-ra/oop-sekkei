class Trip
  attr_reader :bicycles, :customers, :vehicle
  def initialize(bicycles, customers, vehicle)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(preparers)
    preparers.each {|preparer|
      prepare.prepare_trip(self)}
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end

  def prepare_bicycle(bicycle)
    puts "#{bicycle}を準備しました"
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_foods(trip.customers)
  end

  def buy_foods(customers)
    puts "#{customers.size}人分のご飯を用意しました"
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
    puts "#{vehicle}のガソリンを満タンにしました"
  end
  
  def fill_water_tank(vehicle)
    puts "#{vehicle}のウォーターサーバーを満タンにしました"
  end
end
