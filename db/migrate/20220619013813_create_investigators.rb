class CreateInvestigators < ActiveRecord::Migration[7.0]
  def change
    create_table :investigators do |t|
      t.string :first_name
      t.string :last_name
      t.string :id_card
      t.string :email

      t.timestamps
    end
  end
end
