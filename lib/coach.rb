require 'train'

class Coach < Train

  attr_accessor :capacity_passengers

  DEFAULT_CAPACITY_PASSENGERS = 40

  def initialize(options= {})
    @capacity_passengers = options.fetch(:capacity_passengers, DEFAULT_CAPACITY_PASSENGERS)
  end

  def passengers #module
   @passenger ||=[]
  end

  def has_the_train_arrived?(passenger)
    raise "train hasn't arrived yet" if @current_station != passenger.origin
    board(passenger)
  end

  def has_the_train_reached?(passenger)
    raise "please wait till your station" if @current_station != passenger.destination
    disembark(passenger)
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