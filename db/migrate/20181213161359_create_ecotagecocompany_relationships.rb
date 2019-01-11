class CreateEcotagecocompanyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :ecotagecocompany_relationships do |t|
      t.integer :eco_tag_id
      t.integer :eco_company_id
      t.timestamps
    end
  end
end
