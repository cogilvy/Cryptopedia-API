namespace :cryptos do
  desc "Make fetch to API to update prices of cryptos"
  task :update_price => :environment do
    puts "Getting prices..."
    Crypto.getPrices()
    puts "#{Time.now} — Success!"
  end
end

namespace :portfolios do
  desc "Log value of portfolio each day"
  task :get_values => :environment do
    puts "Getting values..."
    Portfolio.recordValues()
    puts "Success!"
  end
end
