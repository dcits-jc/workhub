class CreateManagementworkflowitskillRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :managementworkflowitskill_relationships do |t|
      t.integer :management_workflow_id
      t.integer :tag_itskill_id
      t.timestamps
    end
  end
end
