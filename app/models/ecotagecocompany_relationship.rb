class EcotagecocompanyRelationship < ApplicationRecord
  # n:m eco
  belongs_to :eco_tag
  belongs_to :eco_company
end

# == Schema Information
#
# Table name: ecotagecocompany_relationships
#
#  id             :integer          not null, primary key
#  eco_tag_id     :integer
#  eco_company_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
