class Coach

  attr_accessor :capacity_passengers

  DEFAULT_CAPACITY_PASSENGERS = 40

  def initialized (options= {})
    @capacity_passengers = options.fetch(:capacity_passengers, DEFAULT_CAPACITY_PASSENGERS)
  end

  def passengers #module
   @passenger ||=[]
  end

  def board(passenger)
    raise "This coach is full" if passenger_count == DEFAULT_CAPACITY_PASSENGERS
    passengers << passenger
  end

  def passenger_count #module
    passengers.count
  end 

  def disembark(passenger)
    raise "There are no passengers on the train" if passenger_count == 0
    passengers.delete(passenger)
  end

end