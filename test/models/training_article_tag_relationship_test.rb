require 'test_helper'

class TrainingArticleTagRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: training_article_tag_relationships
#
#  id                  :integer          not null, primary key
#  training_tag_id     :integer
#  training_article_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
