class AddEngineeringcostandcustodychargetoproject < ActiveRecord::Migration[5.1]
  def change
  	add_column :projects, :engineering_costs, :integer, default: 0
  	add_column :projects, :custody_charge, :integer, default: 0
  end
end
