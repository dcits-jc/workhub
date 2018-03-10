class CreateWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :workflows do |t|

      # 建立工作流开始与结束时间
      t.datetime :begin_time
      t.datetime :end_time
      
      # 工作内容
      t.text :content

      # 关联项目
      t.integer :project_id

      t.timestamps
    end
  end
end
