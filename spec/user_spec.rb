require 'user'

describe User do

  let(:user) {User.new}
  
  it "swipe into the tube" do
    user.swipe_into_tube
    expect(user.swipe_into_tube).to be true
  end

end

