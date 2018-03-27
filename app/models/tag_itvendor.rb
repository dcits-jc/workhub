class TagItvendor < ApplicationRecord

  # n:m 相关工作流
  has_many :projectworkflowitvendor_relationships
  has_many :project_workflows, through: :projectworkflowitvendor_relationships, source: :project_workflow

  # n:m 相关管理工作流
  has_many :managementworkflowitvendor_relationships
  has_many :management_workflows, through: :managementworkflowitvendor_relationships, source: :management_workflow


  # n:m 熟悉 it 厂商的用户
  has_many :useritvendor_relationships
  has_many :users, through: :useritvendor_relationships, source: :user

  # 按照时间排序
  scope :order_by_created_at, -> { order("created_at ASC") }

end

# == Schema Information
#
# Table name: tag_itvendors
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
