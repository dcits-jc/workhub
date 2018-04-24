# == Schema Information
#
# Table name: projects
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :text
#  builder_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  binding_team_id        :integer
#  projecttype            :string
#  sales_id               :integer
#  code                   :string
#  pm_id                  :integer
#  project_class          :string
#  customer_name          :string
#  customer_contact_name  :string
#  customer_contact_phone :string
#  customer_contact_email :string
#  area                   :string
#  begin_time             :datetime
#  end_time               :datetime
#  is_disabled            :boolean          default(FALSE)
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
