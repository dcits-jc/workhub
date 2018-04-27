class AddAttachmentsColunmToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :academic_attachment, :string
  end
end
