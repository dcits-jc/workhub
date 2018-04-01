class AddBindingteamToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :binding_team_id, :integer
  end
end
