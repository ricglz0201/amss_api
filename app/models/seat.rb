# Class for Seat model
class Seat < ApplicationRecord
  belongs_to :bus, inverse_of: :seats
end
