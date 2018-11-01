class AddImgToTrainingTag < ActiveRecord::Migration[5.1]
  def change
    add_column :training_tags, :img, :string
  end
end
