class EcoTag < ApplicationRecord
  # 生态合作伙伴标签
  has_many :ecotagecocompany_relationships
  has_many :eco_companies, through: :ecotagecocompany_relationships, source: :eco_company
end

# == Schema Information
#
# Table name: eco_tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
