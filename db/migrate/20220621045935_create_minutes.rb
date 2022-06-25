class CreateMinutes < ActiveRecord::Migration[7.0]
  def change
    create_table :minutes do |t|
      t.integer :number
      t.date :date

      t.timestamps
    end
  end
end
