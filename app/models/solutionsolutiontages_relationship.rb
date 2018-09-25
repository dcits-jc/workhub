class SolutionsolutiontagesRelationship < ApplicationRecord


  belongs_to :solution
  belongs_to :solution_tag

end

# == Schema Information
#
# Table name: solutionsolutiontages_relationships
#
#  id              :integer          not null, primary key
#  solution_tag_id :integer
#  solution_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
