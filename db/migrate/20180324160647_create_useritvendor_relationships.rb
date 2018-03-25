class CreateUseritvendorRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :useritvendor_relationships do |t|
      t.integer :user_id
      t.integer :tag_itvendor_id
      t.timestamps
    end
  end
end
