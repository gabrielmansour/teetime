class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.datetime :starts_at
      t.timestamps
    end
  end
end
