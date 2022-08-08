class AddColumnArticleToAgreement < ActiveRecord::Migration[7.0]
  def change
    add_column :agreements, :article_id, :integer, null: false
    add_foreign_key :agreements, :articles, column: :article_id
  end
end
