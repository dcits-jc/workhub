require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  builder_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  binding_team_id :integer
#  projecttype     :string
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#
