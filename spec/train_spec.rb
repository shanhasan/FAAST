require "train"

describe Train do

let (:train) {Train.new}


context "it should do the basics" do

  it "is initialized with 10 coaches" do
    expect(train.coaches).to eq(10)
  end

  it "should not be initialized at a station" do
    expect(train.current_station).to eq(nil)
  end

  it "can travel between stations" do
    route = ["london bridge", "bank", "morgate", "old street"]
    train.station_stop(route)
    expect(train.current_station).to eq "london bridge"
    train.station_stop(route)
    expect(train.current_station).to eq("bank")
  end

  it "should have left a station before arriving at the next one" do
    route = ["london bridge", "bank", "morgate", "old street"]
    train.station_stop(route)
    expect(train.current_station).to eq "london bridge"
  end

  it "should have a route" do

  end

  it "should be able to stop at specific stations on the route" do
  
  end

  it "should release passengers when at their destination" do

  end

  it "should pick up passengers when at their origin" do

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