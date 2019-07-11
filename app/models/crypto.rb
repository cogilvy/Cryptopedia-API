class Crypto < ApplicationRecord
  has_many :favorites
  has_many :purchases

  def self.getPrices
    request = RestClient.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=200", headers={"X-CMC_PRO_API_KEY" => "6aebf809-98d8-4cf2-8cac-cd341a21e097"})
    response = JSON.parse(request.body)

    response["data"].each do |crypto|
      @crypto = Crypto.find_by(name: crypto["name"])
      if @crypto
        @crypto.update(
          price: crypto["quote"]["USD"]["price"],
          market_cap: crypto["quote"]["USD"]["market_cap"],
          volume: crypto["quote"]["USD"]["volume_24h"],
          change_1hr: crypto["quote"]["USD"]["percent_change_1h"],
          change_24hr: crypto["quote"]["USD"]["percent_change_24h"],
          change_7d: crypto["quote"]["USD"]["percent_change_7d"]
        )
      else
        puts "#{crypto}, Not in database"
      end
    end
  end

end
