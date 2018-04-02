class AddLevelAndCostToUser < ActiveRecord::Migration[5.1]
  def change
    # 等级
    add_column :users, :level, :string
    # cost
    add_column :users, :cost, :integer
  end
end
