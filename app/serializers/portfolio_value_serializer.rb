class PortfolioValueSerializer < ActiveModel::Serializer
  attributes :id, :portfolio, :value, :date
end
