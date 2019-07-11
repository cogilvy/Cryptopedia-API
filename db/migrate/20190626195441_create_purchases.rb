class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.decimal :quantity
      t.belongs_to :crypto, foreign_key: true
      t.belongs_to :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
