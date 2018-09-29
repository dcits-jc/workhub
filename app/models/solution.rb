class Solution < ApplicationRecord

  mount_uploader :solution_pic, AttachmentUploader


  # n:m 对应标签
  has_many :solutionsolutiontages_relationships
  has_many :solution_tags, through: :solutionsolutiontages_relationships, source: :solution_tag

  scope :order_by_created, -> { order("created_at ASC") }

end

# == Schema Information
#
# Table name: solutions
#
#  id           :integer          not null, primary key
#  type         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  background   :text
#  desc         :text
#  value        :text
#  success_case :text
#  solution_pic :string
#
