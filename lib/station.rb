class Station

  def passengers #module
    @passenger ||=[]
  end

  def credit
  end

  def scan_in(passenger)
    raise "Not enough credit" if passenger.credit < 2
    passengers << passenger 
  end

  def scan_out(passenger) 
    passengers.delete(passenger)
  end

  def passenger_count #module
    passengers.count
  end 

  def has_train?
    @train
  end

  def arrival(train)
    @train = true
  end

  def departure(train)
    @train = false
  end

end