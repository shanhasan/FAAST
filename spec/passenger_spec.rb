require 'passenger'

describe Passenger do

  let(:passenger) {Passenger.new}

  it "can have an account" do
    expect(passenger.account).to be true
  end

  it "can top up and account" do
  end

  it "can have money deducted from the account" do
  end

end

#Tests
#Can have an account
#can top up account
#can have money deducted from account


