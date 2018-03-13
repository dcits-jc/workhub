class ProjectWorkflow < ApplicationRecord
  # 工作内容必须填写
  validates :content, presence: true

  # 一个工作流应该对应一个项目(非强制)
  belongs_to :project, optional: true

  # 与 feed 流 1:1
  has_one :feed, as: :feedable


end

# == Schema Information
#
# Table name: project_workflows
#
#  id         :integer          not null, primary key
#  begin_time :datetime
#  end_time   :datetime
#  content    :text
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
