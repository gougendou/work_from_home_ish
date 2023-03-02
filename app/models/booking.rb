class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace
  validates :booking_status, inclusion: { in: %w(requested accepted declined), message: "Not a valid response" }
end
