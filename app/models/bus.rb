# Class for Bus model
class Bus < ApplicationRecord
  belongs_to :seats, inverse_of: :bus
  has_and_belongs_to_many :routes, inverse_of: :buses
end
