class CgColunmExtraCostToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :extra_cost, :integer
  end
end
