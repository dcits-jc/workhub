class CreateTrainingArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :training_articles do |t|
      t.string :name
      t.string :plantform
      t.string :place
      t.integer :level
      t.timestamps
    end
  end
end
