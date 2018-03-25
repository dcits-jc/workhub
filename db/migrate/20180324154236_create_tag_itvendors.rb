class CreateTagItvendors < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_itvendors do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
