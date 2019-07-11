class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :crypto, :portfolio, :quantity
  def crypto
    {
      crypto_id: self.object.crypto.id,
      name: self.object.crypto.name,
      price: self.object.crypto.price,
      change_24hr: self.object.crypto.change_24hr
    }
  end
  def portfolio
    {
      portfolio_id: self.object.portfolio.id,
      name: self.object.portfolio.name,
      budget: self.object.portfolio.budget
    }
  end
end
