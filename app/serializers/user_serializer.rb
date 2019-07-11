class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :favorites, :games
  has_many :portfolios, include_nested_associations: true
  has_many :purchases, include_nested_associations: true
end
