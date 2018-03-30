class AddSalesItcodeToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :sales_id, :integer
  end
end
