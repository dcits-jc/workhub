class ProjectworkflowitskillRelationship < ApplicationRecord

  belongs_to :project_workflow
  belongs_to :tag_itskill

end

# == Schema Information
#
# Table name: projectworkflowitskill_relationships
#
#  id                  :integer          not null, primary key
#  project_workflow_id :integer
#  tag_itskill_id      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
