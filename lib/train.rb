class Train 

  attr_accessor :coaches, :route, :current_station
  attr_reader :itenerary

  DEFAULT_NUM_COACHES = 10

  def initialize(route='', location='', coaches='')
    @coaches = DEFAULT_NUM_COACHES
    @current_station = location  
  end

  def route 
    @route ||= []
  end

  # def location
  #   @location = route.shift
  # end 

  def station_stop(route) 
    new_location = route.shift
    @current_station << new_location
  end


end