class AddForeignKeyToTrades < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :trades, :transactions, column: :transaction_id
  end
end
