class AddStartTimeAndEndTimeToFeeds < ActiveRecord::Migration[5.1]
  def change
    # 加入 start_time
    add_column :feeds, :begin_time, :datetime
    add_column :feeds, :end_time, :datetime
  end
end
