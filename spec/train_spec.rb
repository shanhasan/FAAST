require "train"
require "coach"

describe Train do

let (:train)    {Train.new}
let (:coach)    {Coach.new}
let (:station)  {double :station}
let (:passenger1) {double :passenger, :origin => "bank", :destination => "old street"}
let (:passenger2) {double :passenger, :origin => "bank", :destination => "angle"}

let (:route)    { ["london bridge", "bank", "morgate", "old street", "angle"] }

  def train_journey_leg
    train.depart(route)
    expect(train.current_station).to eq nil
    train.stop(route)
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
end


#Tests
#Should be initialized with 10 coaches
#Should not be initialized at a Station
#Can travel between stations
#Train should have a route
#Train should be able to stop at specific stations on the route
#Should release passengers when at their destination
#should pick up passengers when at their origin 