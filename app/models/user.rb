class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 一个用户只隶属于同一个团队
  belongs_to :team, optional: true

  # 1:n 创建项目
  has_many :projects
  # 改名一对多关系为 build_projects : builder
  has_many :build_projects, class_name: "Project"



  # n:m 参与项目
  has_many :project_relationships
  has_many :participated_projects, through: :project_relationships, source: :project


  # 搜索常规项目
  def self.search(search)
    if search
      where('name LIKE ? or code LIKE ?',"%#{search}%","%#{search}%")
    else
      scoped
    end
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
#  password_resetting     :boolean          default(TRUE)
#
# Indexes
#
#  index_users_on_code                  (code) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
