class AddBookingStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_status, :string, default: "requested", null: false
  end
end
