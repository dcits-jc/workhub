class CreateProjectparticipatedRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :projectparticipated_relationships do |t|
      # 项目用户多对多
      t.integer :user_id
      t.integer :project_id
      
      t.timestamps
    end
  end
end
