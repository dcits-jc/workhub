class Team < ApplicationRecord
  # 名字唯一验证
  validates :name, presence: true, uniqueness: true

  # 建立后要建立对应的四种部门类型工作
  # after_create :create_binding_managementprojects!()

  # 一个团队拥有多个成员
  has_many :users

  # n:m 管理项目
  has_many :teammanager_relationships
  has_many :managers, through: :teammanager_relationships, source: :user

  # 绑定的项目1:n
  has_many :binding_projects, class_name: 'Project',foreign_key: "binding_team_id",dependent: :destroy

  # 设置树型隶属关系
  belongs_to :parent, class_name: "Team", optional: true
  has_many :children, class_name: "Team", foreign_key: "parent_id"





  scope :order_by_name, -> { order("name ASC") }


  scope :no_parents, -> {where(parent_id: nil)}

  # scope :no_children, -> {where(parent_id: nil)}

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


  # 上级部门与下级部门是否存在
  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

  # 这个团队以及子团队的所有成员
  def members
    mem_arr = []
    # 如果这个团队有子团队
    if self.has_children?
      self.children.each do |c|
        mem_arr = mem_arr + c.users
      end
    # 如果没有子团队
    else
      mem_arr = c.users
    end
    return mem_arr
  end


  # 建立绑定的相关管理项目
  def create_binding_managementprojects!(user)
    # 如果用户不存在就填写管理员
    if user.blank?
      user = (User.where(is_admin: true)).first
    end
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

  # 在某段时间内的全体成员工作量累计
  def time_workloads(start_time,end_time)
    loads = 0
    # 如果用户有子部门累子部门工作量(递归)
    if self.has_children?
      self.children.each do |c|
        loads = loads + c.time_workloads(start_time,end_time)
      end
    else
      self.users.each do |u|
        loads = loads + u.time_workloads(start_time,end_time)
      end
    end 

    return loads
  end

  # 计算某段时间内本部门的总体工作饱和度
  def time_workloads_precent(start_time,end_time)
    # 额定成员每周工作小时40h
    user_num = 0
    if self.has_children?
      self.children.each do |c|
        user_num = user_num + c.users.count
      end
    else
      user_num = self.users.count
    end

    current_week_workload = self.time_workloads(start_time,end_time)

    if user_num == 0
      return 0
    else
      return (current_week_workload/user_num * 2.5).round(1)
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
#  team_type   :string
#  parent_id   :integer
#
# Indexes
#
#  index_teams_on_name  (name) UNIQUE
#
