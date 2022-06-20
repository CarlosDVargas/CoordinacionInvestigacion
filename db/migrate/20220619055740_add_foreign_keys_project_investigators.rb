class AddForeignKeysProjectInvestigators < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :project_investigators, :projects, column: :project_id, on_delete: :cascade
    add_foreign_key :project_investigators, :investigators, column: :investigator_id
  end
end
