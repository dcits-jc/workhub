class ManagementworkflowitvendorRelationship < ApplicationRecord

  belongs_to :management_workflow
  belongs_to :tag_itvendor

end

# == Schema Information
#
# Table name: managementworkflowitvendor_relationships
#
#  id                     :integer          not null, primary key
#  management_workflow_id :integer
#  tag_itvendor_id        :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
