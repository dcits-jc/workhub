class Solution < ApplicationRecord

  mount_uploader :solution_pic, AttachmentUploader

end

# == Schema Information
#
# Table name: solutions
#
#  id           :integer          not null, primary key
#  type         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  background   :text
#  desc         :text
#  value        :text
#  success_case :text
#  solution_pic :string
#
