class Feed < ApplicationRecord

  belongs_to :user

  # 隶属于某个可以作为 feed流的对象
  belongs_to :feedable, polymorphic: true, dependent: :destroy

  scope :order_by_recent, -> { order("created_at DESC") }




end

# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  feedable_id   :integer
#  feedable_type :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  begin_time    :datetime
#  end_time      :datetime
#
