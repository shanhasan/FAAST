class Passenger

attr_accessor :origin, :account, :destination

def initialize(origin='', destination='')
  @account = 0
  @origin = origin
  @destination = destination
end

def topup(number)
  @account += number
end

def deduct(number = 2)
  @account -= number
end

end