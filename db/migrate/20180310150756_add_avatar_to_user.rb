class AddAvatarToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_attachment, :string
  end
end
