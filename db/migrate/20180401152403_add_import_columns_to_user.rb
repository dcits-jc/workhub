class AddImportColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    # itcode
    add_column :users, :itcode, :string
    # 入职时间
    add_column :users, :entry_time, :string
    # 平台
    add_column :users, :area_name, :string
    # 当前状态
    add_column :users, :status, :string
    # 岗位类别
    add_column :users, :worktype, :string
    # 成本中心
    add_column :users, :cost_center, :string
  end
end
