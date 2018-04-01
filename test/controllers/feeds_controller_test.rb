# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  feedable_id   :integer
#  feedable_type :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  begin_time    :datetime
#  end_time      :datetime
#

require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
