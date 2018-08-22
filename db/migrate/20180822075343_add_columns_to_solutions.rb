class AddColumnsToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :background, :text
    add_column :solutions, :desc, :text
    add_column :solutions, :value, :text
    add_column :solutions, :success_case, :text
    add_column :solutions, :solution_pic, :string
  end
end
