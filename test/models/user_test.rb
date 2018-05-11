require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  title                  :string
#  code                   :string
#  phone                  :string
#  description            :text
#  team_id                :integer
#  is_admin               :boolean          default(FALSE)
#  password_resetting     :boolean          default(TRUE)
#  avatar_attachment      :string
#  itcode                 :string
#  entry_time             :string
#  area_name              :string
#  status                 :string
#  worktype               :string
#  cost_center            :string
#  level                  :string
#  cost                   :integer
#  resume_attachment      :string
#  idcard_attachment      :string
#  degree                 :string
#  degree_attachment      :string
#  academic_attachment    :string
#  is_updateattachment    :boolean          default(FALSE)
#  extra_cost             :integer
#  is_feedneeded          :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_code                  (code) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
