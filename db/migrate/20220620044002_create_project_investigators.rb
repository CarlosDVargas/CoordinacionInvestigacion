class CreateProjectInvestigators < ActiveRecord::Migration[7.0]
  def change
    create_table :project_investigators do |t|
      t.integer :project_id, null: false
      t.integer :investigator_id, null: false
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :project_investigators, :projects, column: :project_id, on_delete: :cascade
    add_foreign_key :project_investigators, :investigators, column: :investigator_id
  end
end
