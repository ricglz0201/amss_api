# Class for Bus model
class Bus < ApplicationRecord
  has_and_belongs_to_many :routes, inverse_of: :buses
end
