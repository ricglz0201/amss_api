# Class for Reservation model
class Reservation < ApplicationRecord
  belongs_to :user, inverse_of: :reservations
  belongs_to :stop, inverse_of: :reservations
  belongs_to :trip, inverse_of: :reservation
  has_one :seat, through: :trip, inverse_of: :reservations

  def trip_date
    trip.date.strftime('%d/%m/%y')
  end
end
