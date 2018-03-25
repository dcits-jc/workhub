class ProjectworkflowitvendorRelationship < ApplicationRecord

  belongs_to :project_workflow
  belongs_to :tag_itvendor

end

# == Schema Information
#
# Table name: projectworkflowitvendor_relationships
#
#  id                  :integer          not null, primary key
#  project_workflow_id :integer
#  tag_itvendor_id     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
