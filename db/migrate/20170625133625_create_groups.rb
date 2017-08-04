class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.text  :group_name, null: false, unique: true
      t.string :image
      t.integer :group_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
