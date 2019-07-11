class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.string :logo
      t.money :market_cap
      t.money :volume
      t.decimal :change_1hr
      t.decimal :change_24hr
      t.decimal :change_7d

      t.timestamps
    end
  end
end
