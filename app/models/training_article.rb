class TrainingArticle < ApplicationRecord
  # 必须有名称
  validates :name, presence: true
  # 必须有类型
  validates :plantform, presence: true
  validates :place, presence: true
  validates :level, presence: true
  validates :wechatlink, presence: true

  # n:m 标签对文章
  has_many :training_article_tag_relationships
  has_many :training_tags, through: :training_article_tag_relationships, source: :training_tag

end

# == Schema Information
#
# Table name: training_articles
#
#  id         :integer          not null, primary key
#  name       :string
#  plantform  :string
#  place      :string
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wechatlink :string
#
