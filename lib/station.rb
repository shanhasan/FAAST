class Station

  attr_accessor :station, :capacity_trains, :capacity_passengers

  DEFAULT_CAPACITY_PASSENGERS = 200
  DEFAULT_CAPACITY_TRAINS = 2

  def initialize(options = {}) 
    @capacity_trains = options.fetch(:capacity_trains, DEFAULT_CAPACITY_TRAINS)
    @capacity_passengers = options.fetch(:capacity_passengers, DEFAULT_CAPACITY_PASSENGERS)
    @station = Station
  end

  def passengers #module
    @passenger ||=[]
  end

  def trains
    @trains ||=[]
  end

  # def credit #module
  # end

  def scan_in(passenger)
    raise "Not enough credit" if passenger.credit < 2
    raise "The station is full" if passenger_count == DEFAULT_CAPACITY_PASSENGERS
    passengers << passenger 
  end

  def scan_out(passenger) 
    passengers.delete(passenger)
  end

  def passenger_count #module
    passengers.count
  end 

  def train_count
    trains.count
  end

  def arrival(train)
    raise "The platform is currently occupied, please wait" if train_count == DEFAULT_CAPACITY_TRAINS
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

end