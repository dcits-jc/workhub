class TagItskill < ApplicationRecord

  # n:m 相关工作流
  has_many :projectworkflowitskill_relationships
  has_many :project_workflows, through: :projectworkflowitskill_relationships, source: :project_workflow


  # n:m 相关管理工作流
  has_many :managementworkflowitskill_relationships
  has_many :management_workflows, through: :managementworkflowitskill_relationships, source: :management_workflow

  # n:m 拥有 it 技能的用户
  has_many :useritskill_relationships
  has_many :users, through: :useritskill_relationships, source: :user


  # 按照时间排序
  scope :order_by_created_at, -> { order("created_at ASC") }


end

# == Schema Information
#
# Table name: tag_itskills
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
