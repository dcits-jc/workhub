class CreateProjectmanagerRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :projectmanager_relationships do |t|
      # 项目用户管理多对多
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
