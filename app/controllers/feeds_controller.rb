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
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new

    @feeds = current_user.feeds.order_by_recent
  end


  def week
    # start_date = params[:TAssets_turnover_ratio]
    # 用户创建时间
    user_created_time = current_user.create_at
  end



  # 历史区间
  def history
    start_date = params[:start_date]
    end_date = params[:end_date]

    # 设置当前时间
    @current_time = Time.now
    # 历史周
    @history_weeks = weekindex(Time.now, current_user.created_at)

    # 项目工作流
    @project_workflow = ProjectWorkflow.new
    # 非项目工作流
    @management_workflow = ManagementWorkflow.new




    @feeds = current_user.feeds.where('created_at > ? and created_at < ?',start_date,end_date)
  end


  private





end
