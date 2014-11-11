require 'passenger'

describe Passenger do

  let(:passenger) {Passenger.new}

  it "Initialized account with 0 money" do
    expect(passenger.account).to eq(7)
  end

  it "can top up and account" do
    passenger.topup(5)
    expect(passenger.account).to eq(12)
  end

  it "can have money deducted from the account" do
    passenger.deduct
    expect(passenger.account).to eq(5)
  end
end

#Tests
#Can have an account
#can top up account
#can have money deducted from account


