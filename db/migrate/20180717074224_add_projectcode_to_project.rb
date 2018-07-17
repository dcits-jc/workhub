class AddProjectcodeToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :project_costs, :project_code, :string
  end
end
