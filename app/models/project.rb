class Project < ApplicationRecord
  # 拥有一个创建者
  belongs_to :builder, class_name: 'User', foreign_key: 'builder_id'



  # n:m 参与项目
  has_many :project_relationships
  has_many :members, through: :project_relationships, source: :user


  # 加入成员
  def join!(user)
    self.members << user
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
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  builder_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#
