class AddIsFeedneededToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_feedneeded, :boolean, default: false
  end
end
