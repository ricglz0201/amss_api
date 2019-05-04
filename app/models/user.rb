# Model for users
class User < ApplicationRecord
  has_many :reservations, inverse_of: :user
end
