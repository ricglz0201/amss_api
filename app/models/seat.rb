# Class for Seat model
class Seat < ApplicationRecord
  belongs_to :bus, inverse_of: :seats
  has_many :routes, through: :bus, inverse_of: :seats
  has_many :trips, inverse_of: :seat
  has_many :reservations, through: :trips, inverse_of: :seat
end
