class CreateManagementWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :management_workflows do |t|

      # 建立工作流开始与结束时间
      t.datetime :begin_time
      t.datetime :end_time
      
      # 工作内容
      t.text :content

      # 关联项目
      t.integer :project_id

      # 工时
      t.string :worktype
      # 工时
      t.float :hours
      # 成本
      t.float :cost


      t.timestamps
    end
  end
end
