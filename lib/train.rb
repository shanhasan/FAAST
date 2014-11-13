class Train 

  attr_accessor :coaches, :route, :current_station
  attr_reader :itenerary

  def initialize(route='', location='', coaches='')
    @coaches = 10
    @current_station = @location  
  end

  def route 
    @route ||= []
  end

  # def location
  #   @location = route.shift
  # end 

  def station_stop 
    @location = route.shift
    @current_station << @location
  end


end