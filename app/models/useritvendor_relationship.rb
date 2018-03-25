class UseritvendorRelationship < ApplicationRecord

  belongs_to :user
  belongs_to :tag_itvendor

end

# == Schema Information
#
# Table name: useritvendor_relationships
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tag_itvendor_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
