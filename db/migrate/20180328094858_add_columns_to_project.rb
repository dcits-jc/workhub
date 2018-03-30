class AddColumnsToProject < ActiveRecord::Migration[5.1]
  def change
    # 对应项目经理(仅为 form, 不真实记录)
    add_column :projects, :pm_id, :integer
    # 项目级别
    add_column :projects, :project_class, :string
    # 客户名
    add_column :projects, :customer_name, :string
    # 客户联系人姓名
    add_column :projects, :customer_contact_name, :string
    # 客户联系人电话
    add_column :projects, :customer_contact_phone, :string
    # 客户联系人邮件
    add_column :projects, :customer_contact_email, :string
    # 地区
    add_column :projects, :area, :string

    # 开始时间
    add_column :projects, :begin_time, :datetime
    # 结束时间
    add_column :projects, :end_time, :datetime
  end
end
