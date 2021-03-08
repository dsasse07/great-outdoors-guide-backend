class User < ApplicationRecord
  has_secure_password
  has_many :visits
  has_many :images, through: :visits
  validates :username, uniqueness: { case_sensitive: false }

end
