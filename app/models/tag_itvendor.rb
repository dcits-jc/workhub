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
  scope :order_by_commit_count, -> { includes(:project_workflows).sort_by{|t| t.commit_count}.reverse }

  # 为了避免来回计算预设置的顺序
  scope :order_by_staic, -> { where(id:[1,2,4,3,6,8,22,18,7,9,5]) }

  def total_hours
    sum = 0
    self.project_workflows.each {|p| sum+=p.hours}
    sum
  end

  def commit_count
    sum = 0
    self.project_workflows.each {|p| sum+=1}
    sum
  end

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
