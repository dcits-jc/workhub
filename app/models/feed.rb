class Feed < ApplicationRecord

  # 隶属于某个可以作为 feed流的对象
  belongs_to :feedable, polymorphic: true

end

# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  feedable_id   :integer
#  feedable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
