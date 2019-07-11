require 'rest-client'
require 'json'


Favorite.destroy_all
Purchase.destroy_all
Crypto.destroy_all
Portfolio.destroy_all
Game.destroy_all
User.destroy_all


user1 = User.create(name: "Chris Ogilvy", username: "chris", password: "123", premium: true, wins: 0)
user2 = User.create(name: "Luka", username: "luka", password: "123", premium: true, wins: 0)
user3 = User.create(name: "Rei", username: "rei", password: "123", premium: false, wins: 0)

game1 = Game.create(title: "Test Game" ,start: 3.days.ago, end: 1.day.ago, budget: 100000)

portfolio1 = Portfolio.create(name: "The Ballers", user_id: user1.id, game_id: game1.id)

request = RestClient.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest", headers={"X-CMC_PRO_API_KEY" => "6aebf809-98d8-4cf2-8cac-cd341a21e097"})
response = JSON.parse(request.body)

response["data"].each do |crypto|
  Crypto.create(
    name: crypto["name"],
    symbol: crypto["symbol"],
    price: crypto["quote"]["USD"]["price"],
    market_cap: crypto["quote"]["USD"]["market_cap"],
    logo: "https://cdn3.iconfinder.com/data/icons/bitcoin-cryptocurrency-mining/100/bitcoin-07-512.png",
    volume: crypto["quote"]["USD"]["volume_24h"],
    change_1hr: crypto["quote"]["USD"]["percent_change_1h"],
    change_24hr: crypto["quote"]["USD"]["percent_change_24h"],
    change_7d: crypto["quote"]["USD"]["percent_change_7d"]
  )
end



PortfolioValue.create(portfolio_id: 70, value: 150, date: 10.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 250, date: 9.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 300, date: 8.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 500, date: 7.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 250, date: 6.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 275, date: 5.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 200, date: 4.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 175, date: 3.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 120, date: 2.days.ago)
PortfolioValue.create(portfolio_id: 70, value: 250, date: 1.day.ago)

PortfolioValue.create(portfolio_id: 71, value: 100000, date: 10.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 110000, date: 9.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 95000, date: 8.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 99745, date: 7.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 125000, date: 6.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 150000, date: 5.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 200000, date: 4.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 175000, date: 3.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 250000, date: 2.days.ago)
PortfolioValue.create(portfolio_id: 71, value: 320000, date: 1.day.ago)




puts "Done Seeding"
