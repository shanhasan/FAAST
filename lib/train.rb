class Train 

  attr_accessor :coaches, :route, :current_station
  attr_reader :itenerary

  def initialize(route='', location='', coaches='')
    @coaches = 10
    @current_station  
  end

  def route 
    @station ||= []
  end

  def station(station)
    route << station
  end

  def journey(route)
    station.each do |station|
      current_station << station
    end
  end


end