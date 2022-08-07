class CreateAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.integer :agreementNumber
      t.integer :articleNumber
      t.string :description
      t.timestamps
    end
  end
end
