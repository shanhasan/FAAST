# require 'coach'

class Train 

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
end