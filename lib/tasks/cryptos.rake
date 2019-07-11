namespace :cryptos do
  desc "Make fetch to API to update prices of cryptos"
  task :update_price => :environment do
    puts "Getting prices..."
    Crypto.getPrices()
    puts "#{Time.now} — Success!"
  end

end
