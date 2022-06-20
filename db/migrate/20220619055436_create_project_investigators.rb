class CreateProjectInvestigators < ActiveRecord::Migration[7.0]
  def change
    create_table :project_investigators do |t|
      t.references :project, null: false
      t.references :investigator, null: false
      t.integer :role, null: false
      t.timestamps
    end
  end
end
