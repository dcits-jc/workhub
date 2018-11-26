class CreateTrainingTags < ActiveRecord::Migration[5.1]
  def change
    create_table :training_tags do |t|
      t.string :name
      t.string :training_type
      t.timestamps
    end
  end
end
