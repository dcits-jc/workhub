class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      # 组织名
      t.string :name
      # 团队简介
      t.text :description

      t.timestamps
    end

    # 团队 code 不能重复
    add_index :teams, :name, :unique => true
  end
end
