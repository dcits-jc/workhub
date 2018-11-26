class TrainingArticleTagRelationship < ApplicationRecord

  belongs_to :training_tag
  belongs_to :training_article


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
