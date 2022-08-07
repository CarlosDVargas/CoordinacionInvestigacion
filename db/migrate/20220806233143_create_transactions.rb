class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :agreementNumber
      t.integer :status, default: 0, null: false
      t.string :description
      t.timestamps
    end
  end
end
