class Solution < ApplicationRecord
  # 必须有名称
  validates :name, presence: true
  # 必须有背景介绍
  validates :background, presence: true
  # 必须有简介
  validates :desc, presence: true
  # 必须有价值点
  validates :value, presence: true
  # 必须有图片
  validates :solution_pic, presence: true

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
