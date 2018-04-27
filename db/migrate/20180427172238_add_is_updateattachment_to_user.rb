class AddIsUpdateattachmentToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_updateattachment, :boolean, default: false
  end
end
