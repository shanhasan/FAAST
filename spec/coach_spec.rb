require 'coach'
require 'train'

describe Coach do

  let (:coach) {Coach.new}
  let (:train) {Train.new}
  let (:passenger) {double :passenger}
  let (:passenger1) {double :passenger, :origin => "bank", :destination => "old street"}
  let (:passenger2) {double :passenger, :origin => "london bridge", :destination => "morgate"}

  context "Basic coach functions" do

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

    it "passenger count can't be negative" do
      expect(coach.passenger_count).to eq(0)
      expect{coach.disembark(passenger)}.to raise_error "There are no passengers on the train"
    end
  end

  context "More advanced coach functions" do

    it "should pick up passengers when at their origin" do
      coach.current_station= 'bank'
      coach.has_the_train_arrived?(passenger1)
      expect(coach.passenger_count).to eq(1)
    end
 
    it "should Not pick up passengers when Not at their origin" do
      coach.current_station= 'bank'
      expect{coach.has_the_train_arrived?(passenger2)}.to raise_error "train hasn't arrived yet"
    end

    it "should release passengers when at their destination" do
      coach.passengers == [passenger2]
      coach.current_station= 'morgate'
      coach.has_the_train_reached?(passenger2)
      expect(coach.passenger_count).to eq(0)
    end
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
