class AddCodeToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :code, :string
  end
end
