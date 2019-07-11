namespace :portfolios do
  desc "Log value of portfolio each day"
  task :get_values => :environment do
    puts "Getting values..."
    Portfolio.recordValues()
    puts "Success!"
  end
end
