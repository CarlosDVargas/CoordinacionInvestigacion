class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :number
      t.integer :minute_id
      t.integer :project_id

      t.timestamps
    end
  end
end
