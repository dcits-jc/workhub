class ManagementworkflowitskillRelationship < ApplicationRecord

  belongs_to :management_workflow
  belongs_to :tag_itskill

end

# == Schema Information
#
# Table name: managementworkflowitskill_relationships
#
#  id                     :integer          not null, primary key
#  management_workflow_id :integer
#  tag_itskill_id         :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
