class Team < ApplicationRecord
  # 名字唯一验证
  validates :name, presence: true, uniqueness: true

  # 一个团队拥有多个成员
  has_many :users

  # n:m 管理项目
  has_many :teammanager_relationships
  has_many :managers, through: :teammanager_relationships, source: :user


  # 增加成员
  def join!(user)
    self.users << user
    self.save
  end

  # 加入管理员
  def join_manager!(user)
    self.managers << user
    self.save
  end

  # 搜索常规项目
  def self.search(search)
    if search
      where('name LIKE ?',"%#{search}%")
    else
      scoped
    end
  end

end

# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_teams_on_name  (name) UNIQUE
#
