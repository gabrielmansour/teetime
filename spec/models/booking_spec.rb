require 'rails_helper'

RSpec.describe Booking do
  describe "DURATION" do
    subject { Booking::DURATION }
    it { should == 20.minutes }
  end

  it { should validate_presence_of :user }
  it { should validate_presence_of :starts_at }

  def booking_at(minutes, seconds = 0)
    build(:booking, starts_at: Time.now.change(min: minutes, sec: seconds))
  end

  describe "start times" do
    it "should only be bookable every 20 minutes" do
      expect(booking_at(0)).to be_valid
      expect(booking_at(20)).to be_valid
      expect(booking_at(40)).to be_valid
      expect(booking_at(50)).to_not be_valid
    end

    it "must be rounded to the nearest minute" do
      expect(booking_at(0,0)).to be_valid
      expect(booking_at(0,1)).to_not be_valid
      expect(booking_at(0,42)).to_not be_valid
    end
  end
end
