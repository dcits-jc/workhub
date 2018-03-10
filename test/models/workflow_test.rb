require 'test_helper'

class WorkflowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: workflows
#
#  id         :integer          not null, primary key
#  begin_time :datetime
#  end_time   :datetime
#  content    :text
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
