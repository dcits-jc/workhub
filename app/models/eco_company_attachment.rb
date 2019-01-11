class EcoCompanyAttachment < ApplicationRecord

  belongs_to :eco_company

  validates :attachment, presence: true

  mount_uploader :attachment, AttachmentUploader

end

# == Schema Information
#
# Table name: eco_company_attachments
#
#  id             :integer          not null, primary key
#  attachment     :string
#  eco_company_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
