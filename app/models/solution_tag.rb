class SolutionTag < ApplicationRecord
  # 必须有名称
  validates :name, presence: true
  # 必须有类型
  validates :solution_type, presence: true
  
  # n:m 对应标签
  has_many :solutionsolutiontages_relationships
  has_many :solutions, through: :solutionsolutiontages_relationships, source: :solution

  scope :it_direction, -> { where(solution_type: '按技术方向') }
  scope :it_industry, -> { where(solution_type: '按行业') }

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
