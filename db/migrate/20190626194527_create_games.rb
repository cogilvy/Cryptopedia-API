class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.decimal :budget

      t.timestamps
    end
  end
end
