require 'test_helper'

class ProjectCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
#
