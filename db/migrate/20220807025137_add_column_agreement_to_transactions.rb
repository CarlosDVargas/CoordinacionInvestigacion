class AddColumnAgreementToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :agreement_id, :integer, null: false
    add_foreign_key :transactions, :agreements, column: :agreement_id
  end
  
end
