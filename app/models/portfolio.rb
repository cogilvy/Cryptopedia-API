class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :portfolio_values
  has_many :purchases, :dependent => :delete_all
  has_many :cryptos, through: :purchases
  validates :game_id, uniqueness: { scope: :user_id, :errors=>"You are already in this game!"}
  validates :budget, numericality: {greater_than_or_equal_to: 0}

  def getValueForPortfolio
    purchases = Purchase.where(portfolio: self.id)
    valueArray = purchases.map do |purchase|
      (purchase.crypto.price * purchase.quantity)
    end
    i = 0
    sum = 0
    while i < valueArray.length do
      sum += valueArray[i]
      i += 1
    end
    return sum.round
  end

  def self.recordValues
    Portfolio.all.each do |port|
      PortfolioValue.create(portfolio_id: port.id, value: port.getValueForPortfolio, date: DateTime.now)
    end
  end

end
