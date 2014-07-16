class Booking < ActiveRecord::Base
  DURATION = 20.minutes

  belongs_to :user

  validates :starts_at, presence: true
  validates :user, presence: true
  validate :validate_starts_at_20_minute_interval

  private

  def validate_starts_at_20_minute_interval
    unless !starts_at.nil? && starts_at.sec.zero? && ( starts_at.min % (DURATION / 1.minute) == 0 )
      errors.add :starts_at, "must be at a 20-minute interval"
    end
  end
end
