class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.integer :trade_id

      t.timestamps
    end
  end
end
