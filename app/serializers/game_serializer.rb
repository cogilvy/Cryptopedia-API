class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :budget, :start, :end, :portfolios, :users
  has_many :portfolios, include_nested_associations: true
  def users
    self.object.users.map do |user|
      {
        id: user.id,
        name: user.name,
        username: user.username
      }
    end
  end
end
