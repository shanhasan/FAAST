require 'passenger'

describe Passenger do

  # let(:waterloo) {double :station}
  # let(:old_street) {double :station}
  let(:passenger) {Passenger.new}

context "Passenger account" do

  it "should be Initialized with an origin" do
    expect(passenger.origin).not_to eq(nil)
  end

  it "should be Initialized with an destination" do
    expect(passenger.destination).not_to eq(nil)
  end

  it "Initialized account with 0 money" do
    expect(passenger.account).to eq(0)
  end

  it "can create a new passenger with a origin & distination" do
    Shan = Passenger.new('London Bridge', 'Old Street')
    expect(Shan.origin).to eq 'London Bridge'
    expect(Shan.destination).to eq "Old Street"
  end

  it "can top up an account" do
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


