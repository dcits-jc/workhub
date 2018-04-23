# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_type   :string
#  parent_id   :integer
#
# Indexes
#
#  index_teams_on_name  (name) UNIQUE
#

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
