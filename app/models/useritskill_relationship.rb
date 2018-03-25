class UseritskillRelationship < ApplicationRecord

  belongs_to :user
  belongs_to :tag_itskill

end

# == Schema Information
#
# Table name: useritskill_relationships
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  tag_itskill_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
