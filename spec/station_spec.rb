require 'station'

describe Station do

  let (:station) {Station.new}
  let (:passenger) {double :passenger, credit: 2}
  let (:passenger_low_credit) {double :passenger, credit: 1}
  let (:train) {double :train}
  
  context "It should do the basics" do

    it "should let passengers scan in" do
     station.scan_in(passenger)
      expect(station.passenger_count).to eq(1)
    end

    it "should let passengers scan out" do
      station.scan_in(passenger)
      station.scan_out(passenger)
      expect(station.passenger_count).to eq(0)
   end

    it "should allow trains to stop at station" do
      station.arrival(train)
      expect(station.train_count).to eq(1)
    end

    it "should allow trains to depart station" do
      station.arrival(train)
      station.departure(train)
      expect(station.train_count).to eq(0)
    end
  end

  context "It should have more advanced functionalities" do

    it "should reject passengers with low credit" do
      expect{station.scan_in(passenger_low_credit)}.to raise_error RuntimeError
      expect(station.passenger_count).to eq(0)
    end

    it "should reject passengers when the station is full" do
      200.times{station.scan_in(passenger)}
      expect{station.scan_in(passenger)}.to raise_error RuntimeError
    end

    it "should stop trains when platform is occupied" do
      2.times{station.arrival(train)}
      expect{station.arrival(train)}.to raise_error RuntimeError
    end
  end
end

#Tests
#is empty when built 
#has a location
#Let passengers in, >
#let passengers out, >
#Only let passengers in if they have enough money >
#Let trains into the station >
#let trains leave the station >