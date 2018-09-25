class CreateSolutionsolutiontagesRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :solutionsolutiontages_relationships do |t|
      t.integer :solution_tag_id
      t.integer :solution_id
      t.timestamps
    end
  end
end
