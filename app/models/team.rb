class Team < ApplicationRecord

  # 一个团队拥有多个成员
  has_many :users

  # 增加成员
  def add_member!(user)
    self.users << user
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
