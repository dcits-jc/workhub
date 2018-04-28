class AddExtraCostToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :extra_cost, :float
  end
end
