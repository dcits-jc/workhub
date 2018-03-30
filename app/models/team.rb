class Team < ApplicationRecord
  # 名字唯一验证
  validates :name, presence: true, uniqueness: true

  # 一个团队拥有多个成员
  has_many :users

  # n:m 管理项目
  has_many :teammanager_relationships
  has_many :managers, through: :teammanager_relationships, source: :user

  # 绑定的项目1:n
  has_many :binding_projects, class_name: 'Project',foreign_key: "binding_team_id",dependent: :destroy

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

  # 建立绑定的相关管理项目
  def create_binding_managementprojects!(user)
    managementproject_dict = {
      '厂商交流' => 'technical_exchange',
      '认证考试' => 'certification_exam',
      '技术提升' => 'tech_improvement',
      '部门工作' => 'team_work',
      '休假' => 'day_off'
    }
    managementproject_dict.each do |m|
      p = Project.create(name: self.name+'_'+m[0], binding_team_id: self.id,projecttype: m[1],builder_id: user.id,sales_id: user.id)
      self.binding_projects << p
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
