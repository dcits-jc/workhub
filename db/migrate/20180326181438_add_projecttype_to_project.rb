class AddProjecttypeToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :projecttype, :string
  end
end
