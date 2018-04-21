class AddResumeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :resume_attachment, :string
    add_column :users, :idcard_attachment, :string
    add_column :users, :degree, :string
    add_column :users, :degree_attachment, :string
  end
end
