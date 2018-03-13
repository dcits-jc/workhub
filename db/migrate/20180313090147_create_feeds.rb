class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|

      # 加入被识别的多态 feed
      t.integer :feedable_id
      t.string :feedable_type

      t.timestamps
    end
  end
end
