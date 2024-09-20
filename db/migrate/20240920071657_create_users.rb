class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username
      t.references :user_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
