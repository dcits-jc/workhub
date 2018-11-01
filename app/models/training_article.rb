class TrainingArticle < ApplicationRecord

  # n:m 标签对文章
  has_many :training_article_tag_relationships
  has_many :training_tags, through: :teammanager_relationships, source: :training_tag

end

# == Schema Information
#
# Table name: training_articles
#
#  id          :integer          not null, primary key
#  name        :string
#  is_online   :boolean
#  is_interior :boolean
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
