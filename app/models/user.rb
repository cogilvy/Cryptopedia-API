class User < ApplicationRecord
  has_many :portfolios
  has_many :favorites
  has_many :cryptos, through: :favorites
  has_many :games, through: :portfolios
  has_many :purchases, through: :portfolios
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end
