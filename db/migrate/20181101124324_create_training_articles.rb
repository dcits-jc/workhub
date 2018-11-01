class CreateTrainingArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :training_articles do |t|
      t.string :name
      t.boolean :is_online
      t.boolean :is_interior
      t.integer :level
      t.timestamps
    end
  end
end
