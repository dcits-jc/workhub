class AddParentToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :parent_id, :integer
  end
end
