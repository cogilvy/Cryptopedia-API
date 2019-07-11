class Game < ApplicationRecord
  has_many :portfolios
  has_many :users, through: :portfolios
end
