class CreateUseritskillRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :useritskill_relationships do |t|
      t.integer :user_id
      t.integer :tag_itskill_id
      t.timestamps
    end
  end
end
