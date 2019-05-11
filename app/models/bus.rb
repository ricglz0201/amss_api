# Class for Bus model
class Bus < ApplicationRecord
  has_many :seats, inverse_of: :bus
  has_and_belongs_to_many :routes, inverse_of: :buses
end
