# Model for users
class User < ApplicationRecord
  self.primary_key = 'uid'
  has_many :reservations, inverse_of: :user
end
