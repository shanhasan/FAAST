require 'coach'

class Train < Coach

  attr_accessor :coaches, :route, :current_station
  attr_reader :itenerary

  DEFAULT_NUM_COACHES = 10

  def initialize(route='', location='', coaches='')
    @coaches = DEFAULT_NUM_COACHES
    @route = []
    @current_station
  end

  def depart(route)
    @current_station = nil
  end

  def stop(route) 
    raise "Train hasn't left the last station yet" unless @current_station == nil
    new_location = route.shift
    @current_station = new_location
  end

  def passengers_board(passenger)
    if 
      @current_station == passenger.origin
      board(passenger)
    else
      raise "train hasn't arrived yet"
    end
  end

  def passenger_disembark(passenger)
    if 
      @current_station == passenger.destination
      disembark(passenger)
    else
      raise "Please wait till you reach your destination"
    end
  end

end