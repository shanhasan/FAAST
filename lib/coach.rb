class Coach

  def passengers #module
   @passenger ||=[]
  end

  def board(passenger)
    passengers << passenger
  end

  def passenger_count #module
    passengers.count
  end 

  def disembark(passenger)
    passengers.delete(passenger)
  end

end