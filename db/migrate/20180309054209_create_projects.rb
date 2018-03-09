class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      # 项目名
      t.string :name

      # 项目描述
      t.text :description

      # 创建者
      t.integer :builder_id

      t.timestamps
    end


    # 用户 code 不能重复
    add_index :projects, :name, :unique => true

  end
end
