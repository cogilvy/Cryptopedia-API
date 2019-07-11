class CreatePortfolioValues < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_values do |t|
      t.belongs_to :portfolio, foreign_key: true
      t.decimal :value
      t.datetime :date

      t.timestamps
    end
  end
end
