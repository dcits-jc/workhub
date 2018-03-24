class AddColumnsToProjectWorkflows < ActiveRecord::Migration[5.1]
  def change
    # 工时
    add_column :project_workflows, :worktype, :string
    # 工时
    add_column :project_workflows, :hours, :float
    # 成本
    add_column :project_workflows, :cost, :float
  end
end
