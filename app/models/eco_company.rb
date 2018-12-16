class EcoCompany < ApplicationRecord
  # 生态伙伴公司
  # n:m 对应标签
  has_many :ecotagecocompany_relationships
  has_many :eco_tags, through: :ecotagecocompany_relationships, source: :eco_tag

  # 1:n 附件
  has_many :eco_company_attachments

  mount_uploader :img, AttachmentUploader

end

# == Schema Information
#
# Table name: eco_companies
#
#  id            :integer          not null, primary key
#  name          :string
#  contact_name  :string
#  contact_phone :string
#  description   :text
#  img           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
