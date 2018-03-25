class AddOtherVendorAndSkillToProjectWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :project_workflows, :other_itvendors, :string
    add_column :project_workflows, :other_itskills, :string
  end
end
