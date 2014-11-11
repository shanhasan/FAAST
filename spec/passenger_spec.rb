require 'passenger'

describe Passenger do

  let(:passenger) {Passenger.new}

context "Passenger account" do

  it "Initialized account with 0 money" do
    expect(passenger.account).to eq(0)
  end

  it "can top up and account" do
    passenger.topup(5)
    expect(passenger.account).to eq(5)
  end

  it "can top up continiously & different values each time" do
    passenger.topup(5)
    passenger.topup(7)
    passenger.topup(3)
    expect(passenger.account).to eq(15)
  end

  it "can have money deducted from the account" do
    passenger.topup(7)
    passenger.deduct
    expect(passenger.account).to eq(5)
  end
end

context "Passenger origin" do

  
  
end
end

#Tests
#Can have an account
#can top up account
#can have money deducted from account


