class CreateManagementworkflowitvendorRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :managementworkflowitvendor_relationships do |t|
      t.integer :management_workflow_id
      t.integer :tag_itvendor_id
      t.timestamps
    end
  end
end
