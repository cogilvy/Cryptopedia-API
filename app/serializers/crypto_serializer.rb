class CryptoSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :price, :logo, :market_cap, :volume, :change_1hr, :change_24hr, :change_7d, :favorites, :purchases
end
