require 'test_helper'

class ManagementWorkflowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: management_workflows
#
#  id              :integer          not null, primary key
#  begin_time      :datetime
#  end_time        :datetime
#  content         :text
#  project_id      :integer
#  worktype        :string
#  hours           :float
#  cost            :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  other_itvendors :string
#  other_itskills  :string
#
