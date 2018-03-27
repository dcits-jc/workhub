class AddColumnToManagementWorkflows < ActiveRecord::Migration[5.1]
  def change
    add_column :management_workflows, :other_itvendors, :string
    add_column :management_workflows, :other_itskills, :string
  end
end
