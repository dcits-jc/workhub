class AddColunmToUser < ActiveRecord::Migration[5.1]
  def change
    # 用户真实姓名
    add_column :users, :name, :string
    # 用户的职位
    add_column :users, :title, :string
    # 用户的唯一代码
    add_column :users, :code, :string

    # 用户 code 不能重复
    add_index :users, :code, :unique => true

    # 用户电话号码
    add_column :users, :phone, :string

    # 组织 id
    add_column :users, :team_id, :integer

    # 用户密码当前重置状态,如果未 true,默认情况下首次登陆会要求重置密码,重置后把这个改成 false
    add_column :users, :password_resetting, :boolean, default: true



  end
end
