require "train"
require "coach"

describe Train do

let (:train)    {Train.new}
let (:coach)    {Coach.new}
let (:station)  {double :station}
let (:passenger1) {double :passenger, :origin => "london bridge", :destination => "old street"}
let (:passenger2) {double :passenger, :origin => "bank", :destination => "angle"}

let (:route)    { ["london bridge", "bank", "morgate", "old street", "angle"] }

  def train_journey_leg
    train.depart(route)
    expect(train.current_station).to eq nil
    train.stop(route)
  end

  def train_hasnt_arrived_yet
    expect{train.passengers_board(passenger1)}.to raise_error "train hasn't arrived yet"
  end

  def pick_up_passengers
    train.stop(route)
    train.passengers_board(passenger1)
    train.depart(route)
    train.stop(route)
    train.passengers_board(passenger2)
  end

  def disembark_passengers
    train.depart(route)
    train.stop(route)
    train.depart(route)
    train.stop(route)
    train.passenger_disembark(passenger1)
    expect{train.passenger_disembark(passenger2)}.to raise_error "Please wait till you reach your destination"
    train.depart(route)
    train.stop(route)
    train.passenger_disembark(passenger2)
  end

  def try_to_disembark
    expect{train.passenger_disembark(passenger1)}.to raise_error "Please wait till you reach your destination"
    expect{train.passenger_disembark(passenger2)}.to raise_error "Please wait till you reach your destination"
  end

  context "it should do the basics" do

    it "is initialized with 10 coaches" do
      expect(train.coaches).to eq(10)
    end

    it "should not be initialized at a station" do
      expect(train.current_station).to eq nil
    end

    it "can travel between stations" do
      train.stop(route)
      expect(train.current_station).to eq "london bridge"
    end

    it "can't arrive at a station without having left the pervious one" do
      train.stop(route)
      expect{train.stop(route)}.to raise_error RuntimeError
    end

    it "can stop at multiple stations on its route" do
      train.stop(route)
      expect(train.current_station).to eq "london bridge"
      train_journey_leg
      expect(train.current_station).to eq "bank"
    end
  end

  context "it should board & disembark passengers at their origin and destinations" do

    it "should pick up passengers when at their origin" do
      train_hasnt_arrived_yet
      pick_up_passengers
      expect(train.passenger_count).to eq(2)
    end

    it "should release passengers when at their destination" do
      pick_up_passengers
      try_to_disembark
      disembark_passengers
      expect(train.passenger_count).to eq(0)
    end
  end
end


#Tests
#Should be initialized with 10 coaches
#Should not be initialized at a Station
#Can travel between stations
#Train should have a route
#Train should be able to stop at specific stations on the route
#Should release passengers when at their destination
#should pick up passengers when at their origin 