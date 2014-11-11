class Passenger

def initialize()
  @account = 0
end

def account
  @account 
end

def topup(number)
  @account += number
end

def deduct(number = 2)
  @account -= number
end

end