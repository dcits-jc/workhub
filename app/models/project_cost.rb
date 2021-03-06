class ProjectCost < ApplicationRecord
	# 隶属于一个项目
	belongs_to :project, optional: true

  # 隶属于一个导入者
  belongs_to :import_user, class_name: 'User', foreign_key: 'import_user_id'
end

# == Schema Information
#
# Table name: project_costs
#
#  id               :integer          not null, primary key
#  project_id       :integer          default(0)
#  mould_fee        :integer          default(0)
#  labor_fee        :integer          default(0)
#  manual_fee       :integer          default(0)
#  custodian_fee    :integer          default(0)
#  sum_engineer_fee :integer          default(0)
#  sum_fee          :integer          default(0)
#  commit_time      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  project_code     :string
#  import_user_id   :integer
#
