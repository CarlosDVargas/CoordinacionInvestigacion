class AddColumnTransactionToTrade < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :transaction_id, :integer, null: false
  end
end
