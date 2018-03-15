class FeedsController < ApplicationController
  layout 'user'


  # 全部工作流
  def index
    
  end

  # 当周
  def current_week
    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    # 项目工作流
    @project_workflow = ProjectWorkflow.new

    @feeds = current_user.feeds.order_by_recent
  end


  def week
    # 用户创建时间
    user_created_time = current_user.create_at
  end





  private





end
