class AddIsDisabledToProject < ActiveRecord::Migration[5.1]
  def change
    # disable
    add_column :projects, :is_disabled, :boolean, default: false
  end
end
