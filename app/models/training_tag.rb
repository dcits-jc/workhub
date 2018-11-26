class TrainingTag < ApplicationRecord
  # 必须有名称
  validates :name, presence: true
  # 必须有类型
  validates :training_type, presence: true

  # 挂载图像logo
  mount_uploader :img, AttachmentUploader


  # 筛出厂商
  scope :all_itvendors, -> { where(training_type: '厂商') }
  # 筛出解决方案
  scope :all_solutions, -> { where(training_type: '解决方案') }
  # 筛出通用
  scope :all_generals, -> { where(training_type: '通用') }


  # n:m 标签对文章
  has_many :training_article_tag_relationships
  has_many :training_articles, through: :training_article_tag_relationships, source: :training_article

end

# == Schema Information
#
# Table name: training_tags
#
#  id            :integer          not null, primary key
#  name          :string
#  training_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  img           :string
#
