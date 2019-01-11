class CreateEcoCompanyAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :eco_company_attachments do |t|
      t.string :attachment
      t.integer :eco_company_id
      t.timestamps
    end
  end
end
