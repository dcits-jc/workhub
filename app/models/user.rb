class User < ApplicationRecord
  # 扩展 Dragonfly 头像模块
  extend Dragonfly::Model
  include Avatarable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # 禁用用户注册
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # 邮箱唯一验证
  validates :email, presence: true, uniqueness: true
  # 编号唯一验证
  validates :code, presence: true, uniqueness: true
  # 名字必须填写验证
  validates :name, presence: true
  # itcode必须填写验证
  validates :itcode, presence: true, uniqueness: true


  # 建立后要做一些初始化操作
  # after_create :user_itinit!


  # 挂载头像
  mount_uploader :avatar_attachment, AvatarAttachmentUploader

  # 挂载其他文件
  mount_uploader :resume_attachment, AttachmentUploader
  mount_uploader :idcard_attachment, AttachmentUploader
  mount_uploader :degree_attachment, AttachmentUploader
  mount_uploader :academic_attachment, AttachmentUploader  


  # 团队关系
  # 一个用户只隶属于同一个团队
  belongs_to :team, optional: true

  # n:m 管理团队
  has_many :teammanager_relationships
  has_many :manager_teams, through: :teammanager_relationships, source: :team

  # 项目管理
  # 1:n 创建项目
  has_many :projects
  # 改名一对多关系为 build_projects : builder
  has_many :build_projects, class_name: "Project",foreign_key: "builder_id"


  # 改名一对多关系为 build_projects :  sales
  has_many :sale_projects, class_name: "Project",foreign_key: "sales_id"

  # n:m 参与项目
  has_many :projectparticipated_relationships
  has_many :participated_projects, through: :projectparticipated_relationships, source: :project

  # n:m 管理项目
  has_many :projectmanager_relationships
  has_many :manage_projects, through: :projectmanager_relationships, source: :project


  # n:m 拥有 it 技能
  has_many :useritskill_relationships
  has_many :tag_itskills, through: :useritskill_relationships, source: :tag_itskill

  # n:m 熟悉 it 厂商
  has_many :useritvendor_relationships
  has_many :tag_itvendors, through: :useritvendor_relationships, source: :tag_itvendor


  # 信息流
  has_many :feeds


  scope :order_by_itcode, -> { order("itcode ASC") }

  # 该段时间提交周报了的用户
  scope :order_by_team, -> { order("team_id ASC") }


  # 搜索用户
  def self.search(search)
    if search
      where('name LIKE ? or itcode LIKE ?',"%#{search}%","%#{search}%")
    else
      scoped
    end
  end

  # # 用户初始化
  # def user_itinit!
  #   # 将团队名字换成 id
  #   self.team = Team.find_by_name(self.team_name)
  #   self.team_name = nil
  #   self.save
  # end



  # 全名
  def name_pinyin
    Pinyin.t(self.name)
  end

  # 头像字符
  def avatar_text
    name_pinyin.chr
  end


  # 判断是否是管理员
  def is_admin?
    self.is_admin
  end

  # 设置为管理员
  def set_admin!
    self.is_admin = true
    self.save
  end

  # 取消管理员
  def cancel_admin!
    self.is_admin = false
    self.save
  end



  # 该用户对应的厂商交流项目
  def project_technical_exchange
    Project.find_by(binding_team_id: self.team_id,projecttype: 'technical_exchange')
  end

  # 该用户对应的认证项目
  def project_certification_exam
    Project.find_by(binding_team_id: self.team_id,projecttype: 'certification_exam')
  end

  # 该用户对应的技术提升项目
  def project_tech_improvement
    Project.find_by(binding_team_id: self.team_id,projecttype: 'tech_improvement')
  end

  # 该用户对应的部门工作项目
  def project_team_work
    Project.find_by(binding_team_id: self.team_id,projecttype: 'team_work')
  end

  # 该用户对应的休假
  def project_day_off
    Project.find_by(binding_team_id: self.team_id,projecttype: 'day_off')
  end


  # 某段时间总工作量合计
  def time_workloads(start_time,end_time)
    current_feeds = self.feeds.where(end_time: start_time..end_time)
    loads = 0
    current_feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    return loads
  end

  # 计算饱和度
  def time_workloads_precent(start_time,end_time)
    current_feeds = self.feeds.where(end_time: start_time..end_time)
    loads = 0
    current_feeds.each do |f|
      loads = loads + f.feedable.hours
    end
    return loads*2.5
  end


end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  title                  :string
#  code                   :string
#  phone                  :string
#  description            :text
#  team_id                :integer
#  is_admin               :boolean          default(FALSE)
#  password_resetting     :boolean          default(TRUE)
#  avatar_attachment      :string
#  itcode                 :string
#  entry_time             :string
#  area_name              :string
#  status                 :string
#  worktype               :string
#  cost_center            :string
#  level                  :string
#  cost                   :integer
#  resume_attachment      :string
#  idcard_attachment      :string
#  degree                 :string
#  degree_attachment      :string
#  academic_attachment    :string
#  is_updateattachment    :boolean          default(FALSE)
#  extra_cost             :integer
#  is_feedneeded          :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_code                  (code) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
