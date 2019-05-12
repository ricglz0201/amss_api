# Class for Route model
class Route < ApplicationRecord
  has_and_belongs_to_many :buses, inverse_of: :routes
  has_and_belongs_to_many :stops, inverse_of: :routes
  has_many :seats, through: :buses, inverse_of: :routes
end
