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

require 'test_helper'

class ProjectWorkflowsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
