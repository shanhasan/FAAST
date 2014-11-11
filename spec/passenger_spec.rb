require 'passenger'

describe Passenger do

  let(:passenger) {Passenger.new}

  it "Initialized account with 0 money0" do
    expect(passenger.acount).to eq(0)
  end

  it "can top up and account" do
    passenger.topup(5)
    expect(passenger.account).to eq(5)
  end

  it "can have money deducted from the account" do
  end

end

#Tests
#Can have an account
#can top up account
#can have money deducted from account


