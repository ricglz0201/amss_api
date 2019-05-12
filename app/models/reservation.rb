# Class for Reservation model
class Reservation < ApplicationRecord
  belongs_to :user, inverse_of: :reservations
  belongs_to :stop, inverse_of: :reservations
  belongs_to :trip, inverse_of: :reservation
  belongs_to :seat, through: :trip, inverse_of: :reservations
end
