class CreateArticleApprovals < ActiveRecord::Migration[7.2]
  def change
    create_table :article_approvals do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
