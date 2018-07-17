class AddUserIdToCost < ActiveRecord::Migration[5.1]
  def change
    add_column :project_costs, :import_user_id, :integer
  end
end
