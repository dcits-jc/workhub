class Admin::TagItskillsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @tag_itskills = TagItskill.includes(:project_workflows).sort_by{|t| t.total_hours}.reverse
    @tag_itskills = @tag_itskills.paginate(:page => params[:page], :per_page => 25)
  end

end
