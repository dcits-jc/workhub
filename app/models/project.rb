class Project < ApplicationRecord
  # 名字唯一验证
  validates :name, presence: true, uniqueness: true
  # 必须有类型
  validates :projecttype, presence: true
  # 必须有对应销售
  validates :sales_id, presence: true
  # code 必须12位
  # validates :code, length: { is: 12 }, presence: false

  # 拥有一个创建者
  belongs_to :builder, class_name: 'User', foreign_key: 'builder_id'

  # 拥有一个对应的销售
  belongs_to :sales, class_name: 'User', foreign_key: 'sales_id'


  # n:m 参与项目
  has_many :projectparticipated_relationships
  has_many :members, through: :projectparticipated_relationships, source: :user

  # n:m 管理项目
  has_many :projectmanager_relationships
  has_many :managers, through: :projectmanager_relationships, source: :user


  # 1:n 对应工作流
  has_many :project_workflows, dependent: :destroy

  # 1:n 对应工作流
  has_many :management_workflows, dependent: :destroy
  

  # 1:n 绑定团队
  belongs_to :binding_team, class_name: "Team", foreign_key: "binding_team_id",optional: true


  # 排序
  scope :order_by_recent, -> { order("created_at DESC") }

  # 加入成员
  def join!(user)
    if !(self.members.include?(user))
      self.members << user
      self.save      
    end
  end

  # 加入管理员
  def join_manager!(user)
    if !(self.managers.include?(user))
      self.managers << user
      self.save
    end
  end

  # 搜索常规项目
  def self.search(search)
    if search
      # users = User.where('name LIKE ?','%#{search}%')
      # binding.pry
      joins(:sales).where("projecttype <> 'technical_exchange' and projecttype <> 'certification_exam' and projecttype <> 'tech_improvement' and projecttype <> 'team_work' and projecttype <> 'day_off'").where('projects.name LIKE ? or projects.code LIKE ? or users.name LIKE ?',"%#{search}%","%#{search}%","%#{search}%")
      # where('name LIKE ? or code LIKE ? and projecttype <> "technical_exchange" and projecttype <> ? and projecttype <> ? and projecttype <> ? and projecttype <> ?',"%#{search}%","%#{search}%",'technical_exchange','certification_exam','tech_improvement','team_work','day_off')
      # where('name LIKE ? or code LIKE ? and projecttype <> "technical_exchange" and projecttype <> "certification_exam" and projecttype <> "tech_improvement" and projecttype <> "team_work" and projecttype <> "day_off"',"%#{search}%","%#{search}%")
      # where('name LIKE ? or code LIKE ?',"%#{search}%","%#{search}%")
    else
      scoped
    end
  end


  def disabled!
    self.is_disabled = true
    self.save
  end

  def enabled!
    self.is_disabled = false
    self.save
  end

  def enabled?
    !self.is_disabled
  end


  # 是否可编辑
  def editor_user?(user)
    # 如果用户是创建者,pm, 或后台管理员
    if user.id == self.builder_id or user.is_admin? or self.managers.include?(user)
      true
    else
      false
    end
  end

end

# == Schema Information
#
# Table name: projects
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :text
#  builder_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  binding_team_id        :integer
#  projecttype            :string
#  sales_id               :integer
#  code                   :string
#  pm_id                  :integer
#  project_class          :string
#  customer_name          :string
#  customer_contact_name  :string
#  customer_contact_phone :string
#  customer_contact_email :string
#  area                   :string
#  begin_time             :datetime
#  end_time               :datetime
#  is_disabled            :boolean          default(FALSE)
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#
