class CreateProjectRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :project_relationships do |t|
      # 项目用户多对多
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
