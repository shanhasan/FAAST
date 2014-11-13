require 'coach'

describe Coach do

  let (:coach) {Coach.new}
  let (:passenger) {double :passenger}

  it "lets passengers enter coach" do
    coach.board(passenger)
    expect(coach.passenger_count).to eq(1)
  end

  it "lets passengers exit coach" do
    coach.board(passenger)
    coach.disembark(passenger)
    expect(coach.passenger_count).to eq(0)
  end

  it "passengers can't enter when train is full" do
    40.times{coach.board(passenger)}
    expect{coach.board(passenger)}.to raise_error RuntimeError
    end

  it "Capacity can't be negative" do
  end

  it "Passenger count can't be negative" do
  end

  it "passenger can only enter when train is at station" do
  end

  it "passengers can only exit when train is at station" do
  end
  
end

#Tests
#Let passengers enter coach
#Let passengers exit coach
#Has a limit
#No passengers can enter after linit
#Passenger count can't be negative
#passengers can only enter when train is at a station
#passengers can only exit when train is at a station
