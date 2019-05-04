# Class for Trip model
class Trip < ApplicationRecord
  belongs_to :seat, inverse_of: :trips
  has_one :reservation, inverse_of: :trip
end
