class ProjectCost < ApplicationRecord
	# 隶属于一个项目
	belongs_to :project

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
#
