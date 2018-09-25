class SolutionTag < ApplicationRecord
  # n:m 对应标签
  has_many :solutionsolutiontages_relationships
  has_many :solutions, through: :solutionsolutiontages_relationships, source: :solution

  scope :it_direction, -> { where("solution_type is '按技术方向'") }
  scope :it_industry, -> { where("solution_type is '按行业'") }

end

# == Schema Information
#
# Table name: solution_tags
#
#  id            :integer          not null, primary key
#  solution_type :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
