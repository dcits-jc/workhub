class CreateProjectworkflowitvendorRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :projectworkflowitvendor_relationships do |t|
      t.integer :project_workflow_id
      t.integer :tag_itvendor_id
      t.timestamps
    end
  end
end
