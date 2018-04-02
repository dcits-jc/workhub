class ProjectWorkflow < ApplicationRecord
  # 工作内容必须填写
  validates :content, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :project_id, presence: true
  validates :worktype, presence: true
  validates :hours, presence: true

  # 一个工作流应该对应一个项目(非强制)
  belongs_to :project, optional: true

  # 与 feed 流 1:1
  has_one :feed, as: :feedable, dependent: :destroy


  # 加入标签
  # n:m 相关厂商标签
  has_many :projectworkflowitskill_relationships
  has_many :tag_itskills, through: :projectworkflowitskill_relationships, source: :tag_itskill

  # n:m 相关方向标签
  has_many :projectworkflowitvendor_relationships
  has_many :tag_itvendors, through: :projectworkflowitvendor_relationships, source: :tag_itvendor



  # 加入 it技能
  def join_tag_itskills(tag)
    self.tag_itskills << tag
  end

  # 加入供应商
  def join_tag_itvendors(tag)
    self.tag_itvendors << tag
  end

end

# == Schema Information
#
# Table name: project_workflows
#
#  id              :integer          not null, primary key
#  begin_time      :datetime
#  end_time        :datetime
#  content         :text
#  project_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  worktype        :string
#  hours           :float
#  cost            :float
#  other_itvendors :string
#  other_itskills  :string
#
