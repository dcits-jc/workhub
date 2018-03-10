class TeammanagerRelationship < ApplicationRecord

  belongs_to :team
  belongs_to :user

end

# == Schema Information
#
# Table name: teammanager_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
