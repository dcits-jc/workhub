class CreateEcoCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :eco_companies do |t|
      t.string :name
      t.string :contact_name
      t.integer :contact_phone
      t.text :description
      t.string :img
      t.timestamps
    end
  end
end
