# Class for Stop model
class Stop < ApplicationRecord
  has_and_belongs_to_many :routes, inverse_of: :stops
end
