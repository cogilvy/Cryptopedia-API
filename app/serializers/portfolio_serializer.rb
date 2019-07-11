class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :game, :budget, :user, :game, :portfolio_values
  def user
    {
      user_id: self.object.user.id,
      name: self.object.user.name,
      username: self.object.user.username,
    }
  end
  has_many :purchases, include_nested_associations: true
end
