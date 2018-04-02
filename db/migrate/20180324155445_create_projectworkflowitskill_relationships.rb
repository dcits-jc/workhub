class CreateProjectworkflowitskillRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :projectworkflowitskill_relationships do |t|
      t.integer :project_workflow_id
      t.integer :tag_itskill_id
      t.timestamps
    end
  end
end
